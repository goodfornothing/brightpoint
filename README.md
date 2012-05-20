Brightpoint API
===============

### Fetch all data points

		GET  	http://brightpoint.herokuapp.com/api/v1/data_points.json
     
    start_point (return points after this x-axis)
    size (the number of points to return)

### Fetch all subjects

		GET   http://brightpoint.herokuapp.com/api/v1/subjects.json

### Fetch a random(ish) subject

		GET   http://brightpoint.herokuapp.com/api/v1/subjects/random.json

### Fetch all classifications and annotations for a given subject

		GET 	http://brightpoint.herokuapp.com/api/v1/subjects/1/classifications.json

### Create a new classification for a given subject

		POST  http://brightpoint.herokuapp.com/api/v1/classifications/new.json
						
		{
			subject_id: integer
			started: timestamp
			ended: timestamp
			annotations: [
				start: x-coordinate
				end: x-coordinate
			]
		}
