from django.db import models

# Create your models here.
from django.db import models
from django.contrib.postgres.fields import JSONField


class StallInfo(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    stallinfo = models.TextField()
    stallposterfile = models.CharField(max_length=50)
    font_type = models.CharField(max_length=50)
    font_colour = models.CharField(max_length=50)
    stallbackgroundfile = models.CharField(max_length=50)
    operatinghours = JSONField()


class StallMenu(models.Model):
    id = models.IntegerField()
    stallmenu = JSONField()
    starttime = models.TimeField()
    endtime = models.TimeField()
    key = models.IntegerField(primary_key=True)
    secondsperperson = models.IntegerField()
    openingdays = JSONField()
    menuname = models.CharField(max_length=50)
