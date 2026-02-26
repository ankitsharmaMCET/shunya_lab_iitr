from django.db import models
from django_resized import ResizedImageField
from django.utils import timezone
from django.utils.text import slugify

class News(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, max_length=255, blank=True)
    date = models.DateField(default=timezone.now)
    summary = models.TextField()
    full_story_content = models.TextField(blank=True, null=True)
    # image = models.ImageField(upload_to='news_images/', blank=True, null=True)
    featured_image = ResizedImageField(
        upload_to='news/', 
        size=[800, 450], 
        crop=['middle', 'center'],
        blank=True,
        null=True
    )
    is_featured = models.BooleanField(default=False)
    
    class Meta:
        verbose_name_plural = "News"
        ordering = ['-date']
        
    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super(News, self).save(*args, **kwargs)

    def __str__(self):
        return self.title


from django.db import models
from django_resized import ResizedImageField

class TeamMember(models.Model):
    MEMBER_CATEGORY = (
        ("director", "Director"),
        ("phd", "PhD Scholar"),
        ("postdoc", "Post-doctoral Researcher"),
        ("associate", "Research Associate"),
    )

    name = models.CharField(max_length=100)
    designation = models.CharField(max_length=100)
    category = models.CharField(max_length=20, choices=MEMBER_CATEGORY)
    bio = models.TextField()
    photo = ResizedImageField(
        upload_to="team/",
        size=[300, 300],
        crop=["middle", "center"],
        blank=True,
        null=True
    )
    research_interests = models.TextField()
    linkedin_link = models.URLField(blank=True)
    google_scholar_link = models.URLField(blank=True)

    # ✅ NEW: manual ordering
    display_order = models.PositiveIntegerField(
        default=999,
        help_text="Lower number shows first (e.g., 1,2,3...)."
    )

    def __str__(self):
        return self.name

    class Meta:
        ordering = ["category", "display_order", "name"]

class ResearchArea(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    icon_class = models.CharField(max_length=50, blank=True, help_text="e.g., fas fa-bolt for Font Awesome icon")
    
    class Meta:
        verbose_name_plural = "Research Areas"
        ordering = ['title']

    def __str__(self):
        return self.title

class Publication(models.Model):
    PUB_TYPE = (
        ('journal', 'Journal Article'),
        ('conference', 'Conference Paper'),
        ('book', 'Book Chapter'),
        ('report', 'Report'),
    )
    
    title = models.CharField(max_length=300)
    authors = models.CharField(max_length=200)
    pub_type = models.CharField(max_length=20, choices=PUB_TYPE)
    journal_conference = models.CharField(max_length=200)
    year = models.PositiveIntegerField()
    abstract = models.TextField()
    link = models.URLField()
    
    class Meta:
        ordering = ['-year']
    
    def __str__(self):
        return f"{self.title} ({self.year})"

# In your models.py file
from django.db import models
from django.utils.text import slugify # Make sure to add this import

class Event(models.Model):
    EVENT_TYPE = (
        ('workshop', 'Workshop'),
        ('seminar', 'Seminar'),
        ('conference', 'Conference'),
        ('webinar', 'Webinar'),
    )

    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=200, unique=True, blank=True) # ADD THIS LINE
    event_type = models.CharField(max_length=20, choices=EVENT_TYPE)
    date = models.DateTimeField()
    location = models.CharField(max_length=100)
    description = models.TextField()
    registration_link = models.URLField(blank=True, null=True)

    class Meta:
        ordering = ['-date']
    
    # ADD THIS SAVE METHOD
    def save(self, *args, **kwargs):
        # If the slug is not set, generate it from the title.
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.title
    


class Opportunity(models.Model):
    POSITION_TYPE = (
        ('phd', 'PhD Position'),
        ('postdoc', 'Post-doctoral Position'),
        ('intern', 'Internship'),
        ('ra', 'Research Assistant'),
    )
    
    title = models.CharField(max_length=100)
    position_type = models.CharField(max_length=20, choices=POSITION_TYPE)
    description = models.TextField()
    requirements = models.TextField()
    application_link = models.URLField(blank=True, null=True)
    deadline = models.DateField(blank=True, null=True)
    is_active = models.BooleanField(default=True)
    
    class Meta:
        verbose_name_plural = "Opportunities"
        ordering = ['-is_active', 'deadline', 'position_type']

    def __str__(self):
        return self.title

class Contact(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    subject = models.CharField(max_length=150)
    message = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.name} - {self.subject}"