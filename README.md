## Brightpoint API

The following endpoints should closely match the Citizen Science platform.

### Fetch all subjects

```bash
GET http://brightpoint.herokuapp.com/api/v1/subjects.json
```

### Fetch a new subject 

To fetch the next subject, replace :previous_subject in the below endpoint.

```bash
GET http://brightpoint.herokuapp.com/api/v1/subjects/:previous_subject/next.json
```

### Fetch all classifications and annotations for a given subject

```bash
GET http://brightpoint.herokuapp.com/api/v1/subjects/1/classifications.json
```

### Create a new classification for a given subject

```bash
POST http://brightpoint.herokuapp.com/api/v1/classifications/new.json
```

With params:

subject_id: integer
started: timestamp
ended: timestamp
annotations: array of annotations containing a start and end x-coordinate

For example:

```bash
curl -F 'subject_id=1' \
	-F 'started=1337508679' \
	-F 'ended=133750467' \
	-F 'annotations[]={start:41750, end:51297}' \
	-F 'annotations[]={start:475, end:41750}' \
	http://brightpoint.herokuapp.com/api/v1/classifications.json 
```

## Endpoints unique to BrightPoint

### Fetch all data points

```bash
GET http://brightpoint.herokuapp.com/api/v1/data_points.json?start_point=390&size=100
```

### Fetch all data points for a single chromosome

```bash
GET http://brightpoint.herokuapp.com/api/v1/chromosome/chr1.json?size=100
```