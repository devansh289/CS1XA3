from social import models

def populate():
	models.UserInfo.objects.create_user_info(username='Kawhi_Leonard',password='Clippers.1')
	models.UserInfo.objects.create_user_info(username='Paul_George',password='Clippers.2')

	models.UserInfo.objects.create_user_info(username='Pascal_Siakam',password='Raptors.1')
	models.UserInfo.objects.create_user_info(username='Steady_Freddy',password='Raptors.2')
	models.UserInfo.objects.create_user_info(username='Matt_Thomas',password='Raptors.3')

	models.UserInfo.objects.create_user_info(username='Anthony_Davis',password='Lakers.1')
	models.UserInfo.objects.create_user_info(username='Lebron_James',password='Lakes.2')

	models.UserInfo.objects.create_user_info(username='Devin_Booker',password='Suns.1')

	models.UserInfo.objects.create_user_info(username='Kevin_Durant',password='Nets.1')
	models.UserInfo.objects.create_user_info(username='Kyrie_Irving',password='Nets.2')

	# IDs
	kawhiID = models.User.objects.get(username='Kawhi_Leonard')
	paulID = models.User.objects.get(username='Paul_George')
	pascalID = models.User.objects.get(username='Pascal_Siakam')
	steadyID = models.User.objects.get(username='Steady_Freddy')
	mattID = models.User.objects.get(username='Matt_Thomas')
	anthonyID = models.User.objects.get(username='Anthony_Davis')
	lebronID = models.User.objects.get(username='Lebron_James')
	devinID = models.User.objects.get(username='Devin_Booker')
	kevinID = models.User.objects.get(username='Kevin_Durant')
	kyrieID = models.User.objects.get(username='Kyrie_Irving')

	#UserInfo Objects

	kawhi = models.UserInfo.objects.get(user=kawhiID)
	paul = models.UserInfo.objects.get(user=paulID)
	pascal = models.UserInfo.objects.get(user=pascalID)
	steady = models.UserInfo.objects.get(user=steadyID)
	matt = models.UserInfo.objects.get(user=mattID)
	anthony = models.UserInfo.objects.get(user=anthonyID)
	lebron = models.UserInfo.objects.get(user=lebronID)
	devin = models.UserInfo.objects.get(user=devinID)
	kevin = models.UserInfo.objects.get(user=kevinID)
	kyrie = models.UserInfo.objects.get(user=kyrieID)

	#print(kawhiID,paulID,pascalID,steadyID,mattID,anthonyID,lebronID,devinID,kevinID,kyrieID)

	kawhi.employment = "Clippers"
	kawhi.save()

def clear():
	models.UserInfo.objects.all().delete()
	models.User.objects.all().delete()


