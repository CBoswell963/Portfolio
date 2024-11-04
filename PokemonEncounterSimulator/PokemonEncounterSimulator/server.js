const express = require("express");
const path = require("path");

const app = express();
const PORT = process.env.PORT || 3000;

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, "public")));

// Route to serve the home page
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public/index.html"));
});

// Route for Encounter Screen
app.get("/encounter", (req, res) => {
    res.sendFile(path.join(__dirname, "public/encounter.html"));
});

// Route for Encounter Result Screen
app.get("/encounterResult", (req, res) => {
    res.sendFile(path.join(__dirname, "public/encounterResult.html"));
});

// Route for Caught Pokemon Screen
app.get("/caught", (req, res) => {
    res.sendFile(path.join(__dirname, "public/caught.html"));
});

// Route for Pokemon Detail Screen
app.get("/pokemonDetail", (req, res) => {
    res.sendFile(path.join(__dirname, "public/pokemonDetail.html"));
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
