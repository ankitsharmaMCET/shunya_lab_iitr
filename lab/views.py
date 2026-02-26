from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone
from django.contrib import messages
from django.core.paginator import Paginator
from .models import News, TeamMember, ResearchArea, Publication, Event, Opportunity, Contact
from .forms import ContactForm # Assuming ContactForm is defined in forms.py
from django.shortcuts import render, get_object_or_404
def home(request):
    """View for the homepage, displaying a limited number of featured items and stats."""
    featured_news = News.objects.filter(is_featured=True).order_by('-date')[:3]
    
    # Get counts for the homepage stats
    team_count = TeamMember.objects.count()
    publications_count = Publication.objects.count()
    projects_count = ResearchArea.objects.count()  # Using research areas as a proxy for projects
    
    return render(request, 'home.html', {
        'featured_news': featured_news,
        'team_count': team_count,
        'publications_count': publications_count,
        'projects_count': projects_count,
    })

def about(request):
    """View for the About page."""
    return render(request, 'about.html')

from django.db.models import Case, When, Value, IntegerField

def team_view(request):
    # Directors separate (still manual order)
    directors = TeamMember.objects.filter(category="director").order_by("display_order", "name")

    # Custom order: postdoc -> phd -> associate
    category_rank = Case(
        When(category="postdoc", then=Value(1)),
        When(category="phd", then=Value(2)),
        When(category="associate", then=Value(3)),
        default=Value(99),
        output_field=IntegerField(),
    )

    researchers = (
        TeamMember.objects
        .exclude(category="director")
        .annotate(category_rank=category_rank)
        .order_by("category_rank", "display_order", "name")
    )

    return render(request, "team.html", {
        "directors": directors,
        "researchers": researchers,
    })

def research(request):
    """View for the research page, listing all research areas."""
    research_areas = ResearchArea.objects.all().order_by('title')
    return render(request, 'research.html', {'research_areas': research_areas})

def publications_view(request):
    """
    View for the publications page with optional filtering.
    Filters by publication type and/or year.
    """
    publications = Publication.objects.all().order_by('-year')
    pub_type = request.GET.get('pub_type')
    year = request.GET.get('year')
    
    if pub_type:
        publications = publications.filter(pub_type=pub_type)
    if year:
        publications = publications.filter(year=year)
        
    return render(request, 'publications.html', {'publications': publications})

def events(request):
    """View for the events page, separating upcoming and past events."""
    now = timezone.now()
    upcoming_events = Event.objects.filter(date__gte=now).order_by('date')
    past_events = Event.objects.filter(date__lt=now).order_by('-date')
    
    return render(request, 'events.html', {
        'upcoming_events': upcoming_events,
        'past_events': past_events,
    })

# In your views.py file


from .models import Event # Make sure to import your Event model

def event_detail(request, slug):
    event = get_object_or_404(Event, slug=slug)
    
    # Check if the event date is in the future
    is_upcoming = event.date > timezone.now()
    
    context = {
        'event': event,
        'is_upcoming': is_upcoming, # Add the flag to the context
    }
    
    return render(request, 'event_detail.html', context)

def news_list(request):
    """
    View for the news list page with pagination.
    Note: Renamed from 'news' to 'news_list' for clarity.
    """
    all_news = News.objects.all().order_by('-date')
    paginator = Paginator(all_news, 10)  # 10 news items per page
    page_number = request.GET.get('page')
    news_list = paginator.get_page(page_number)
    return render(request, 'news.html', {'news_list': news_list})
    
def news_detail(request, slug):
    """
    View for a single news article page.
    Uses the slug to create cleaner URLs.
    """
    news_item = get_object_or_404(News, slug=slug)
    return render(request, 'news_detail.html', {'news_item': news_item})

def opportunities(request):
    """View for the opportunities page, showing only active positions."""
    positions = Opportunity.objects.filter(is_active=True).order_by('deadline')
    return render(request, 'opportunities.html', {'positions': positions})

def contact_view(request):
    """View for the contact page, handling form submission and rendering."""
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Thank you! Your message has been sent.')
            return redirect('contact')
    else:
        form = ContactForm()
    return render(request, 'contact.html', {'form': form})