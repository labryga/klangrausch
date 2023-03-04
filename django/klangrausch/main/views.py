from django.shortcuts import render
from django.http import HttpResponse
from django.views.generic import TemplateView


class Main(TemplateView):
    template_name = 'main.pug'


# async def main(request):
#     return HttpResponse("Klaangrausch...")
