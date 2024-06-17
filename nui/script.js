const searchInput = document.getElementById('searchInput');

window.addEventListener('message', (event) => {
    let data = event.data;
    if (data.action === 'OpenSpawnSelector') {
        document.body.style.display = 'block';
        loadSpawnPoints(data.data, data.titleServer, data.iconTitleServer);
        document.querySelector('.spawn-selector').classList.add('show');
    }
});

function loadSpawnPoints(spawnPoints, titleServer, iconTitleServer) {
    const spawnOptionsContainer = document.querySelector('.spawn-options');
    spawnOptionsContainer.innerHTML = '';
    const titleElement = document.createElement('h2');
    titleElement.textContent = titleServer;
    const iconElement = document.createElement('i');
    iconElement.className = iconTitleServer;
    iconElement.style.color = '#38D9A9';
    titleElement.prepend(iconElement);
    spawnOptionsContainer.appendChild(titleElement);

    const searchInput = document.getElementById('searchSpawnInput');

    spawnPoints.forEach((point, index) => {
        const optionDiv = document.createElement('div');
        optionDiv.className = 'option';
        const input = document.createElement('input');
        input.type = 'radio';
        input.id = `spawn${index}`;
        input.name = 'spawnPoint';
        input.value = point.zone;
        const label = document.createElement('label');
        label.htmlFor = `spawn${index}`;

        if (point.icon) {
            const icon = document.createElement('i');
            icon.className = point.icon;
            icon.style.color = point.iconColor;
            label.appendChild(icon);
        }

        const labelText = document.createElement('span');
        labelText.textContent = point.name;
        label.appendChild(labelText);
        const description = document.createElement('div');
        description.className = 'description';
        description.textContent = point.description;

        if (point.image) {
            const image = document.createElement('img');
            image.src = point.image;
            image.alt = point.name;
            image.className = 'point-image';
            optionDiv.appendChild(image);
        }

        optionDiv.appendChild(input);
        optionDiv.appendChild(label);
        optionDiv.appendChild(description);
        spawnOptionsContainer.appendChild(optionDiv);

        input.addEventListener('change', () => {
            document.querySelectorAll('.option label').forEach(lbl => {
                lbl.classList.remove('selected');
            });
            label.classList.add('selected');
            sendPressedPoint(point.zone);
        });
    });
searchInput.addEventListener('input', function() {
    const searchTerm = this.value.trim().toLowerCase(); 
    const options = document.querySelectorAll('.option'); 
    options.forEach(option => {
        const label = option.querySelector('label'); 
        if (label) {
            const textContent = label.textContent.trim().toLowerCase(); 
            if (textContent.includes(searchTerm)) {
                option.style.display = 'flex'; 
            } else {
                option.style.display = 'none';
            }
        }
    });
});
}

function sendPressedPoint(pointValue) {
    fetch(`https://${GetParentResourceName()}/pressedPoint`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({ point: pointValue }),
    })
}

function sendPressedPointConfirm(pointValue) {
    fetch(`https://${GetParentResourceName()}/ClickedPoint`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({ point: pointValue }),
    })
}

document.getElementById('selectButton').addEventListener('click', () => {
    let selectedPoint = document.querySelector('input[name="spawnPoint"]:checked');
    if (selectedPoint) {
        let pointValue = selectedPoint.value;
        showAlert(`Confirm selection of spawn point ${pointValue}?`, () => {
            sendPressedPointConfirm(pointValue);
            document.querySelector('.spawn-selector').classList.remove('show');
            setTimeout(() => {
                document.body.style.display = 'none';
            }, 300);
        });
    } else {
        showNotification('Please select a spawn point.', 'error');
    }
});

document.getElementById('lastCoordsButton').addEventListener('click', () => {
    showAlert('Retrieve last coordinates?', () => {
        fetch(`https://${GetParentResourceName()}/lastCoords`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({})
        })
        .then(response => response.json())
        .then(data => {
            document.querySelector('.spawn-selector').classList.remove('show');
            setTimeout(() => {
                document.body.style.display = 'none';
            }, 300); 
        });
    });
});


function showAlert(message, callback) {
    const alertContainer = document.getElementById('customAlert');
    const alertMessage = document.getElementById('alertMessage');
    alertMessage.textContent = message;
    alertContainer.style.display = 'flex';
    alertContainer.classList.add('show');

    const confirmButton = document.getElementById('confirmButton');
    const cancelButton = document.getElementById('cancelButton');

    confirmButton.onclick = function() {
        alertContainer.classList.remove('show');
        alertContainer.classList.add('hide');
        setTimeout(() => {
            alertContainer.style.display = 'none';
            alertContainer.classList.remove('hide');
            if (callback && typeof callback === 'function') {
                callback();
            }
        }, 300); 
    };

    cancelButton.onclick = function() {
        alertContainer.classList.remove('show');
        alertContainer.classList.add('hide');
        setTimeout(() => {
            alertContainer.style.display = 'none';
            alertContainer.classList.remove('hide');
        }, 300); 
    };
}

function showNotification(message, type) {
    const notificationElement = document.getElementById('customNotification');
    const notificationMessage = document.getElementById('notificationMessage');

    notificationMessage.textContent = message;
    notificationElement.className = 'custom-notification';
    notificationElement.classList.add('show', type);

    setTimeout(() => {
        notificationElement.classList.remove('show');
    }, 3000); 
}


function updateTime() {
    const clockContainer = document.getElementById('currentClock');
    setInterval(() => {
        const now = new Date();
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const timeString = `${hours}:${minutes}`;
        clockContainer.textContent = timeString;
    }, 1000); 
}

updateTime();