from django.contrib import admin
from django.db import models
from django.forms import Textarea

from .models import (
    Contact,
    Publication,
    TeamMember,
    Opportunity,
    News,
    ResearchArea,
    Event
)


# Admin for Opportunity Model
@admin.register(Opportunity)
class OpportunityAdmin(admin.ModelAdmin):
    list_display = ("title", "position_type", "deadline", "is_active")
    list_filter = ("position_type", "is_active")
    search_fields = ("title", "description")
    ordering = ("-deadline",)


# Admin for Publication Model
@admin.register(Publication)
class PublicationAdmin(admin.ModelAdmin):
    list_display = ("title", "authors", "pub_type", "year")
    list_filter = ("pub_type", "year")
    search_fields = ("title", "authors")
    ordering = ("-year", "title")


# Admin for TeamMember Model
@admin.register(TeamMember)
class TeamMemberAdmin(admin.ModelAdmin):
    list_display = ("display_order", "name", "designation", "category")
    list_display_links = ("name",)          # ✅ clickable field
    list_editable = ("display_order",)      # ✅ editable field
    list_filter = ("category",)
    search_fields = ("name", "designation")
    ordering = ("category", "display_order", "name")

# Admin for News Model
@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    list_display = ("title", "date", "is_featured", "slug")
    list_filter = ("is_featured", "date")
    search_fields = ("title", "summary", "full_story_content")
    prepopulated_fields = {"slug": ("title",)}
    date_hierarchy = "date"
    ordering = ("-date",)

    # Make text fields easier to edit in admin
    formfield_overrides = {
        models.TextField: {"widget": Textarea(attrs={"rows": 16, "style": "width: 100%;"})},
    }


# Admin for ResearchArea Model
@admin.register(ResearchArea)
class ResearchAreaAdmin(admin.ModelAdmin):
    list_display = ("title", "icon_class")
    search_fields = ("title", "description")
    ordering = ("title",)

    formfield_overrides = {
        models.TextField: {"widget": Textarea(attrs={"rows": 10, "style": "width: 100%;"})},
    }


# Admin for Event Model
@admin.register(Event)
class EventAdmin(admin.ModelAdmin):
    list_display = ("title", "event_type", "date", "location")
    list_filter = ("event_type", "date")
    search_fields = ("title", "description", "location")
    date_hierarchy = "date"
    ordering = ("-date",)

    formfield_overrides = {
        models.TextField: {"widget": Textarea(attrs={"rows": 14, "style": "width: 100%;"})},
    }


# Admin for Contact Model
@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ("name", "email", "subject", "timestamp")
    list_filter = ("timestamp",)
    search_fields = ("name", "email", "subject", "message")
    ordering = ("-timestamp",)