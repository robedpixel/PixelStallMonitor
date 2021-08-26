from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from stallmonitor.models import StallInfo
from stallmonitor.models import StallMenu
from django.http import JsonResponse
import os
from pathlib import Path
import base64

server_up = True


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")


def get_status(request):
    return HttpResponse(server_up)


def get_stalls(request):
    stall_data = list(StallInfo.objects.values())
    #send stall info as json
    return JsonResponse(stall_data, safe=False)


def get_stall_id(request):
    data = StallInfo.objects.filter(name=request.GET.get('name', '')).values()
    stallid = data[0].get("id")
    return HttpResponse(stallid)


def get_stall_menu_from_id(request):
    data = StallMenu.objects.filter(id=request.GET.get('id', '')).values()
    jsondata = list(data)
    return JsonResponse(jsondata, safe=False)


def get_stall_menu(request):
    data = StallMenu.objects.values()
    jsondata = list(data)
    return JsonResponse(jsondata, safe=False)


def get_image(request):
    # Send database request for an image on the server
    data = StallInfo.objects.filter(name=request.GET.get('name', '')).values(
        request.GET.get('imagename', ''))
    # Return 404 http error if store has no stall image
    if not data:
        return HttpResponse(status=404)
    else:
        image_name = data[0].get(request.GET.get('imagename', ''))
        if image_name is None:
            return HttpResponse(status=404)
        # Create absolute path to image on server
        script_path = Path(os.path.realpath(__file__)).parent.parent
        image_path = os.path.join(script_path, 'images', image_name)
        try:
            # Load image into server
            image_data = open(image_path, "rb").read()
            # Send image to client
            return HttpResponse(image_data, content_type="image/jpeg")
        except:
            # Return 404 error message if there is an issue loading the image
            return HttpResponse(status=404)
