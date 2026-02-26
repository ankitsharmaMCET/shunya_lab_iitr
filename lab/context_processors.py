from .models import News

def latest_news_processor(request):
    try:
        latest_news = News.objects.order_by('-date').first()
    except News.DoesNotExist:
        latest_news = None
        
    return {'latest_news': latest_news}