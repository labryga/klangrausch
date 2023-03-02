from django.db import models

class Eintrag(models.Model):
    eintrag_titel = models.CharField(max_length=200)

class EintragText(models.Model):
    eintrag_text = models.TextField()
