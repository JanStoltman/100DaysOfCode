# Generated by Django 2.0 on 2017-12-06 09:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('quickstart', '0005_auto_20171206_0944'),
    ]

    operations = [
        migrations.RenameField(
            model_name='attendee',
            old_name='place_name',
            new_name='attendee_name',
        ),
        migrations.RenameField(
            model_name='place',
            old_name='name',
            new_name='place_name',
        ),
    ]
