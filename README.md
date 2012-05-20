Brightpoint API
===============

### Fetch all data points

```bash
GET http://brightpoint.herokuapp.com/api/v1/data_points.json?start_point=390&size=100
```

### Fetch all subjects

```bash
GET http://brightpoint.herokuapp.com/api/v1/subjects.json
```

### Fetch a random(ish) subject

```bash
GET http://brightpoint.herokuapp.com/api/v1/subjects/random.json
```

### Fetch all classifications and annotations for a given subject

```bash
GET http://brightpoint.herokuapp.com/api/v1/subjects/1/classifications.json
```

### Create a new classification for a given subject

```bash
POST http://brightpoint.herokuapp.com/api/v1/classifications/new.json
				
{
	subject_id: integer
	started: timestamp
	ended: timestamp
	annotations: [
		start: x-coordinate
		end: x-coordinate
	]
}
```