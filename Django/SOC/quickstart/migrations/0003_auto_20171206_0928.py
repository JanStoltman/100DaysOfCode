# Generated by Django 2.0 on 2017-12-06 09:28

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ('quickstart', '0002_auto_20171206_0927'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='begins',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='event',
            name='ends',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
