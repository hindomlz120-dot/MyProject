package models;

public class Offre {
    private int id;
    private String titre;
    private String entreprise;
    // 1. زدنا المتغير الجديد هنا
    private String description; 

    public Offre() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }

    public String getEntreprise() { return entreprise; }
    public void setEntreprise(String entreprise) { this.entreprise = entreprise; }

    // 2. زدنا Getters و Setters تاع الوصف باش يروح الخط الأحمر
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
