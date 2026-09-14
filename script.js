async function getVisitorCount() {
    try {
        const response = await fetch("https://func-cloudresume-dev-e6cycaebhwezb3bz.australiaeast-01.azurewebsites.net/api/visitors");

        if (!response.ok){
            throw new Error("API error");

        }
        const data = await response.json()

        document.getElementById("visitor-count").textContent = data.count;
        
    } catch (error) {
        console.log(error)
    }

}
  getVisitorCount();