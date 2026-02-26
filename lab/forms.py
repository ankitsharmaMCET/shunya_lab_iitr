from django import forms
from .models import Contact


class ContactForm(forms.ModelForm):
    class Meta:
        model = Contact
        fields = ["name", "email", "subject", "message"]

        widgets = {
            "name": forms.TextInput(
                attrs={
                    "class": "form-control contact-input",
                    "placeholder": "Your full name",
                    "autocomplete": "name",
                }
            ),
            "email": forms.EmailInput(
                attrs={
                    "class": "form-control contact-input",
                    "placeholder": "you@example.com",
                    "autocomplete": "email",
                }
            ),
            "subject": forms.TextInput(
                attrs={
                    "class": "form-control contact-input",
                    "placeholder": "Subject",
                }
            ),
            "message": forms.Textarea(
                attrs={
                    "class": "form-control contact-input",
                    "placeholder": "Write your message...",
                    "rows": 6,
                }
            ),
        }