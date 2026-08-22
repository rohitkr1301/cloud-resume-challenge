async function getVisitorCount() {
    try {
        const response = await fetch();

        if (!response.ok)
            error = "API error"
        
        data = response.json()

        document.getElementById("visitor-count").textContent = data.count;
        
    } catch (error) {
        console.log(error)
    }

}
  getVisitorCount();