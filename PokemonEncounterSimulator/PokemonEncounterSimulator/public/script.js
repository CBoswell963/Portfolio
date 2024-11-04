// Predefined Pokemon for each environment
const encounterOptions = {
    mountain: ['geodude', 'zubat'],
    river: ['buizel', 'poliwag'],
    plains: ['eevee', 'pikachu']
};

// Array to hold caught Pokemon (could also be fetched from local storage)
let caughtPokemon = JSON.parse(localStorage.getItem('caughtPokemon')) || [];

//constant variables for catch feature
let catchAttempts = 0;
const maxAttempts = 3;

// Global variable for encounter result display
const encounterResultDiv = document.getElementById('encounter-result');

// Function to get the count of caught Pokemon
function getCaughtPokemonCount() {
    return caughtPokemon.length;
}

// Function to add a caught Pokemon to the list, allowing duplicates
function addCaughtPokemon(pokemon) {
    caughtPokemon.push(pokemon); // Allow duplicates
    localStorage.setItem('caughtPokemon', JSON.stringify(caughtPokemon)); // Save to local storage
}


// Function to handle encounter mechanics
function handleEncounter(environment) {
    const encounterResultDiv = document.getElementById('encounter-result');
    const pokemonList = getPokemonForEnvironment(environment);

    if (pokemonList.length > 0) {
        const encounteredPokemon = encounterPokemon(pokemonList);
        if (encounteredPokemon) {
            catchAttempts = 0; // Reset attempts for a new encounter
            encounterResultDiv.innerHTML = `
                You encountered a ${capitalizeFirstLetter(encounteredPokemon.name)}!
                <img src="${encounteredPokemon.image}" alt="${encounteredPokemon.name}">
                <button id="catch-button" onclick="attemptToCatch('${encounteredPokemon.name}')">Try to Catch</button>`
                ;
        } else {
            encounterResultDiv.innerHTML = "No Pokemon encountered.";
        }
    } else {
        encounterResultDiv.innerHTML = "No Pokemon available for this environment.";
    }
}

// This function can return Pokemon based on the selected environment
function getPokemonForEnvironment(environment) {
    const pokemonLineup = {
        mountain: [
            { name: "geodude", image: "https://img.pokemondb.net/sprites/home/normal/geodude.png" },
            { name: "zubat", image: "https://img.pokemondb.net/sprites/home/normal/zubat.png" }
        ],
        river: [
            { name: "buizel", image: "https://img.pokemondb.net/sprites/home/normal/buizel.png" },
            { name: "poliwag", image: "https://img.pokemondb.net/sprites/home/normal/poliwag.png" }
        ],
        plains: [
            { name: "eevee", image: "https://img.pokemondb.net/sprites/home/normal/eevee.png" },
            { name: "pikachu", image: "https://img.pokemondb.net/sprites/home/normal/pikachu.png" }
        ]
    };

    return pokemonLineup[environment] || [];
}

// Simulates a Pokemon encounter
function encounterPokemon(pokemonList) {
    // Randomly decide if an encounter occurs (50% chance)
    if (Math.random() < 0.5) {
        const randomIndex = Math.floor(Math.random() * pokemonList.length);
        return pokemonList[randomIndex]; // Return a random Pokemon
    }
    return null; // No Pokemon encountered
}


// Function to attempt to catch the Pok?mon
function attemptToCatch(pokemon) {
    const caughtPokemonCount = getCaughtPokemonCount();
    const catchSuccessRate = 0.5; // 50% chance to catch
    const catchButton = document.getElementById("catch-button");

    // check if max Pokemon reached 
    if (caughtPokemonCount >= 100) {
        catchButton.innerHTML = "Release Pokemon to Catch More";
        catchButton.disabled = true;
        return;
    }

    // Check if maximum attempts reached
    if (catchAttempts >= maxAttempts - 1) {
        encounterResultDiv.innerHTML = `<p>${capitalizeFirstLetter(pokemon)} broke free. The Pokemon has fled!</p>`;
        resetEncounter();
        return;
    }

    // try to catch pokemon
    const success = Math.random() < catchSuccessRate;
    if (success) {
        addCaughtPokemon(pokemon);
        encounterResultDiv.innerHTML = `<p>Congratulations! You caught ${capitalizeFirstLetter(pokemon)}!</p>`;
        resetEncounter();
    } else {
        catchAttempts++;
        encounterResultDiv.innerHTML += `<p>${capitalizeFirstLetter(pokemon)} broke free! Attempt ${catchAttempts} of ${maxAttempts}.</p>`;
    }
}

// Reset encounter display
function resetEncounter() {
    catchAttempts = 0;
    setTimeout(() => {
        document.getElementById('encounter-result').innerHTML = "Select an environment to encounter Pokemon.";
    }, 2000); // Clear the message after 2 seconds
}

// Function to capitalize the first letter of a string
function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

// Function to display caught Pokemon on caught.html
function displayCaughtPokemon() {
    const listElement = document.getElementById('caught-pokemon-list');
    caughtPokemon = JSON.parse(localStorage.getItem('caughtPokemon')) || []; // Refresh from local storage

    if (caughtPokemon.length === 0) {
        listElement.innerHTML = '<p>You have not caught any Pok?mon.</p>';
        return;
    }

    // Display each caught Pok?mon with its index to allow individual release
    listElement.innerHTML = caughtPokemon.map((pokemon, index) =>
        `<div>
            <span onclick="location.href='/pokemonDetail?name=${pokemon}'">${capitalizeFirstLetter(pokemon)}</span>
            <button onclick="releasePokemon(${index})">Release</button>
        </div>`
    ).join('');
}

// Function to release a Pokemon at a specific index
function releasePokemon(index) {
    const pokemon = caughtPokemon[index];
    if (confirm(`Are you sure you want to release ${capitalizeFirstLetter(pokemon)}?`)) {
        caughtPokemon.splice(index, 1); // Remove specific Pok?mon at index
        localStorage.setItem('caughtPokemon', JSON.stringify(caughtPokemon)); // Update local storage
        displayCaughtPokemon(); // Refresh caught Pok?mon list
    }
}

// Function to display Pokemon detail
function displayPokemonDetail() {
    const urlParams = new URLSearchParams(window.location.search);
    const pokemonName = urlParams.get('name');

    fetch(`https://pokeapi.co/api/v2/pokemon/${pokemonName}`)
        .then(response => response.json())
        .then(data => {
            const detailElement = document.getElementById('pokemon-detail');
            detailElement.innerHTML = `
        <h2>${capitalizeFirstLetter(data.name)}</h2>
        <img src="${data.sprites.front_default}" alt="${data.name}">
        <p>Types: ${data.types.map(typeInfo => capitalizeFirstLetter(typeInfo.type.name)).join(', ')}</p>
        <p>Height: ${(data.height / 10).toFixed(1)} m</p>
        <p>Weight: ${(data.weight / 10).toFixed(1)} kg</p>
      `;
        });
}
