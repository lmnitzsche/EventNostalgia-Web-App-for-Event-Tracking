const eventForm = document.getElementById('eventForm');
const eventList = document.getElementById('eventList');
const concertList = document.getElementById('concertList');
const sortSelect = document.getElementById('sortSelect');
const sortSelectTwo = document.getElementById('sortSelectTwo');
const events = [];
const concerts = [];

function insertEventIntoDatabase(event) {
    fetch('insert_event.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(event),
    })
    .then(response => response.json())
    .then(data => {})
    .catch(error => console.error('Error inserting event:', error));
}

function insertConcertIntoDatabase(concert) {
    fetch('insert_concert.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(concert),
    })
    .then(response => response.json())
    .then(data => {})
    .catch(error => console.error('Error inserting concert:', error));
}


function fetchUserEventsFromDatabase() {
    fetch('fetch_user_events.php')
    .then(response => response.json())
    .then(data => {
        events.push(...data.events);
        concerts.push(...data.concerts);
        displayEvents();
        displayConcerts();
    })
    .catch(error => console.error('Error fetching user events:', error));
}

function deleteEvent(index) {
    const deletedEvent = events.splice(index, 1)[0];
    displayEvents();

    fetch('delete_event.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ id: deletedEvent.id }),
    })
    .then(response => response.json())
    .then(data => {})
    .catch(error => console.error('Error deleting event:', error));
}

function deleteConcert(index) {
    const deletedConcert = concerts.splice(index, 1)[0];
    displayConcerts();

    fetch('delete_concert.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ id: deletedConcert.id }),
    })
    .then(response => response.json())
    .then(data => {})
    .catch(error => console.error('Error deleting concert:', error));
}

eventForm.addEventListener('submit', function(e) {
    e.preventDefault();

    const eventName = document.getElementById('eventName').value;
    const eventDate = document.getElementById('eventDate').value;
    const eventDescription = document.getElementById('eventDescription').value;
    const eventRating = parseFloat(document.getElementById('eventRating').value);
    const eventLabel = document.getElementById('eventLabel').value;
    const eventVenue = document.getElementById('eventVenue').value;

    const event = {
        name: eventName,
        date: eventDate,
        description: eventDescription,
        rating: eventRating,
        label: eventLabel,
        venue: eventVenue,
    };

    insertEventIntoDatabase(event);
    events.push(event);

    const concert = {
        name: eventName,
        date: eventDate,
        description: eventDescription,
        rating: eventRating,
        label: eventLabel,
        venue: eventVenue,
    };

    if(event.label === 'concerts') {
        insertConcertIntoDatabase(concert);
        concerts.push(concert);
    }

    eventForm.reset();
    displayEvents();
    displayConcerts();
});

function displayEvents() {
    const selectedSort = sortSelect.value;

    if(selectedSort === 'latest') {
        events.sort((a, b) => new Date(b.date) - new Date(a.date));
    } else if(selectedSort === 'last') {
        events.sort((a, b) => new Date(a.date) - new Date(b.date));
    } else if(selectedSort === 'rating') {
        events.sort((a, b) => b.rating - a.rating);
    } else if(selectedSort === 'ratingTwo') {
        events.sort((a, b) => a.rating - b.rating);
    }

    eventList.innerHTML = '';
    events.forEach((event, index) => {
        const listItem = document.createElement('li');

        if(event.description == '' && event.venue == '') {
            listItem.innerHTML = `
            <strong>${event.name}</strong><br>
          (${event.date})<br>
            Rating: ${event.rating}<br>
            <button onclick="deleteEvent(${index})">Delete</button>`;
        } else if(event.venue == '') {
            listItem.innerHTML = `
            <strong>${event.name}</strong><br>
          (${event.date})<br>
            Rating: ${event.rating}<br>
            Details: ${event.description}<br>
            <button onclick="deleteEvent(${index})">Delete</button>`;
        } else if(event.description == '') {
            listItem.innerHTML = `
            <strong>${event.name}</strong><br>
            ${event.venue}(${event.date})<br>
            Rating: ${event.rating}<br>
            <button onclick="deleteEvent(${index})">Delete</button>`;
        } else {
            listItem.innerHTML = `
            <strong>${event.name}</strong><br>
            ${event.venue}(${event.date})<br>
            Rating: ${event.rating}<br>
            Details: ${event.description}<br>
            <button onclick="deleteEvent(${index})">Delete</button>`;
        }
        eventList.appendChild(listItem);
    });
}

function displayConcerts() {
    const concertSelect = sortSelectTwo.value;

    if(concertSelect === 'latestTwo') {
        concerts.sort((a, b) => new Date(b.date) - new Date(a.date));
    } else if(concertSelect === 'lastTwo') {
        concerts.sort((a, b) => new Date(a.date) - new Date(b.date));
    } else if(concertSelect === 'ratingSecond') {
        concerts.sort((a, b) => b.rating - a.rating);
    } else if(concertSelect === 'ratingTwoSecond') {
        concerts.sort((a, b) => a.rating - b.rating);
    }

    concertList.innerHTML = '';
    concerts.forEach((concert, index) => {
        const listConcert = document.createElement('li');

        if(concert.description == '' && concert.venue == '') {
            listConcert.innerHTML = `
            <strong>${concert.name}</strong><br>
          (${concert.date})<br>
            Rating: ${concert.rating}<br>
            <button onclick="deleteConcert(${index})">Delete</button>`;
        } else if(concert.venue == '') {
            listConcert.innerHTML = `
            <strong>${concert.name}</strong><br>
          (${concert.date})<br>
            Rating: ${concert.rating}<br>
            Details: ${concert.description}<br>
            <button onclick="deleteConcert(${index})">Delete</button>`;
        } else if(concert.description == '') {
            listConcert.innerHTML = `
            <strong>${concert.name}</strong><br>
            ${concert.venue}(${concert.date})<br>
            Rating: ${concert.rating}<br>
            <button onclick="deleteConcert(${index})">Delete</button>`;
        } else {
            listConcert.innerHTML = `
            <strong>${concert.name}</strong><br>
            ${concert.venue}(${concert.date})<br>
            Rating: ${concert.rating}<br>
            Details: ${concert.description}<br>
            <button onclick="deleteConcert(${index})">Delete</button>`;
        }
        concertList.appendChild(listConcert);
    });
}

document.addEventListener('DOMContentLoaded', fetchUserEventsFromDatabase);
sortSelect.addEventListener('change', displayEvents);
sortSelectTwo.addEventListener('change', displayConcerts);
displayEvents();
displayConcerts();
