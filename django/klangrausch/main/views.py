from django.shortcuts import render
from django.http import HttpResponse

async def index(request):
    return HttpResponse("Klaangrausch...")
