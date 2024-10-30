using Microsoft.EntityFrameworkCore;
using PokedexApp.Models;

namespace PokedexApp.Services
{

    /// <summary>
    /// Database context for accessing Pokemon data using SQLite
    /// </summary>
    public class AppDbContext : DbContext
    {
        /// <summary>
        /// Gets or sets the collection of Pokemon
        /// </summary>
        public DbSet<Pokemon> Pokemons { get; set; }

        /// <summary>
        /// Configures the databse connection for the context
        /// </summary>
        /// <param name="optionsBuilder">The options builder for configuring the database context</param>
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite("Data Source=pokemons.db");
        }
    }
}
