import cv2
import glob
import os
import numpy as np
import multiprocessing
import matplotlib.pyplot as plt
from vehicle_detector import VehicleDetector
from datetime import datetime


ROOT = []
ROOT.append("/Users/akhilkakarla/Documents/pythontesting/SATURDAY_IMAGE_DATA/IMAGE_BACKUP/")
ROOT.append("/Users/akhilkakarla/Documents/pythontesting/MONDAY_IMAGE_DATA/IMAGE_BACKUP/")


def timestamp_to_hours(timestamp):
    """Converts a timestamp to hours."""

    # Convert timestamp to datetime object
    dt_object = datetime.fromtimestamp(timestamp)

    # Extract hours from datetime object
    hours = dt_object.hour

    return hours


car_count_per_hour_saturday = []
hours_saturday = []
car_count_per_hour_monday = []
hours_monday = []
    
for root in range (0, 2):
 #   for foldernum in range (267):

    foldernum = 538

    # Load Veichle Detector
    vd = VehicleDetector()

    # Declare arrays
    timeslot = []
    vehicles = []
    car_count_per_hour = []
    hours = []

    # Load images from a folder
    images_folder = glob.glob(ROOT[root]+str(foldernum)+"/*.jpg")
    images_folder.sort()

    vehicles_folder_count = 0
    previous_hour_value = 0
    total_cars_per_hour = 0

    # Loop through all the images
    for img_path in images_folder:
        #print("Img path", img_path)
        img = cv2.imread(img_path)

        vehicle_boxes = vd.detect_vehicles(img)
        vehicle_count = len(vehicle_boxes)

        filename = os.path.basename(img_path)
        timeslot.append(filename)
        vehicles.append(vehicle_count)
        
        timestamp_value = filename.split(".")
        time_value = timestamp_value[0]

        hours_value = timestamp_to_hours(int(time_value))
        # Update total count
        vehicles_folder_count += vehicle_count
        #print("vehicle_count : ", vehicle_count, hours_value)


        if (previous_hour_value == hours_value):
            total_cars_per_hour += vehicle_count
            #print("total_cars_per_hour *********: ", total_cars_per_hour)


        else:
            car_count_per_hour.append(total_cars_per_hour)
            if (hours_value == 1):
                hours.append(previous_hour_value)
            total_cars_per_hour = 0
            total_cars_per_hour += vehicle_count
            #print("total_cars_per_hour *********: ", total_cars_per_hour)
            previous_hour_value = hours_value
            hours.append(hours_value)


        '''
        for box in vehicle_boxes:
            x, y, w, h = box

            cv2.rectangle(img, (x, y), (x + w, y + h), (25, 0, 180), 3)

            cv2.putText(img, "Vehicles: " + str(vehicle_count), (20, 50), 0, 2, (100, 200, 0), 3)

        cv2.imshow("Cars", img)
        cv2.waitKey(1)
'''
    car_count_per_hour.append(total_cars_per_hour)

    print("Total current count", vehicles_folder_count)
    print(hours)
    print(car_count_per_hour)

    if (root == 0):
        car_count_per_hour_saturday = car_count_per_hour[:]
    else:
        car_count_per_hour_monday = car_count_per_hour[:]

    ################ GRAPH ###############################################

'''
# Create the plot
plt.xticks(np.arange(0, 24, 1))
plt.bar(hours, car_count_per_hour_saturday, label="Typical WEEKEND Traffic", color='green', width=0.5)
plt.bar(hours, car_count_per_hour_monday, label="Typical WEEKDAY Traffic", color='blue', width=0.5)
plt.xlabel('Time Period (hours HH)')
plt.ylabel('Total Vehicles')

# Save the plot as a JPG file
# Use tight_layout to adjust the plot elements
plt.tight_layout()
plt.legend()
plt.savefig("/Users/akhilkakarla/Documents/pythontesting/PLOTS/"+str(foldernum)+".jpg", bbox_inches='tight')
plt.close()
'''

####
N=20
bar_width=0.3
# Position of bars on x-axis
ind = np.arange(N)
plt.xticks(np.arange(0, 24, 1))
plt.bar(ind, car_count_per_hour_saturday, label="Typical WEEKEND Traffic", color='blue', width=bar_width)
plt.bar(ind + bar_width, car_count_per_hour_monday, label="Typical WEEKDAY Traffic", color='orange', width=bar_width)
plt.xlabel('Time Period (hours HH)')
plt.ylabel('Total Vehicles')

# Save the plot as a JPG file
# Use tight_layout to adjust the plot elements
plt.tight_layout()
plt.legend()
plt.savefig("/Users/akhilkakarla/Documents/pythontesting/PLOTS/"+str(foldernum)+".jpg", bbox_inches='tight')
plt.close()