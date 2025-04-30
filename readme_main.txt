# 🚀 Terraform Azure Infrastrukturprosjekt – Webserver og Databaser

Dette prosjektet viser hvordan man bygger opp infrastruktur i Azure ved hjelp av Terraform-moduler.  
Målet er å lære modulbasert oppbygging og automatisering av web- og database-VM-er i en sikker og strukturert nettverksarkitektur.

---

## 📘 Innhold

Dette prosjektet oppretter:

- ✅ 1 webserver (Linux VM med Apache installert)
- ✅ 2 database-VM-er (Linux)
- ✅ Virtuelt nettverk (VNet) med to subnet
- ✅ NSG (Network Security Group) med åpne porter (80/22)
- ✅ Automatisk installasjon av webtjeneste med velkomstmelding
- ✅ Strukturert modulbruk (nettverk, vm, lastbalanserer)

---

## 🗂️ Katalogstruktur
terraform-azure-infrastructure/ ├── main.tf ├── provider.tf ├── README.md ├── modules/ │ ├── network/ │ ├── vm/ │ └── loadbalancer/ (valgfritt)


Arbeidskrav 1: Terraform og Azure



1. Installer nødvendige verktøy

Du må ha følgende på maskinen din:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

--------------------------------------------------------------------------------------------------------------------------------------------------------------

2. Last ned Github filene til foreksempel c:\Terraform\

3. Start Powershell som administrator og skriv "az login". Du får da opp ett innloggingsbilde hvor du velger den Microsoft kontoen du har Azure på.

4. Gå til mappen som Terraform filene ligger (f.eks C:\Terraform)

5. Skriv "terraform init"

6. Skriv "terraform apply"

Skriv yes når du blir spurt.
Dette vil opprette:
-Ressursgruppe
-VNet og subnet
-Webserver + 2 database-VM-er
-NSG-regler
-Apache installert på webserver

7.  Finn public IP til webserver-VM (fra Terraform-output eller Azure Portal)

Åpne IP-en i en nettleser: http://<public-ip>
Du skal se meldingen: "Hallo fra Laerdal"

8. Hvis man ønsker å fjerne alt fra Azure igjen skriver man "terraform destroy"