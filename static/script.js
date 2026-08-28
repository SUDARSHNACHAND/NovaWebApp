// Get HTML elements

const form =
    document.getElementById("contactForm");

const input =
    document.getElementById("name");

const result =
    document.getElementById("result");


// Form submit event

form.addEventListener(
    "submit",
    async function(event) {

        // Prevent page refresh

        event.preventDefault();


        // Get user input

        const name =
            input.value.trim();


        // Check empty input

        if (!name) {

            result.textContent =
                "Please enter your name.";

            result.className =
                "result error";

            input.focus();

            return;
        }


        // Show loading message

        result.textContent =
            "Connecting to Python Flask...";

        result.className =
            "result";


        try {

            // Send data to Flask

            const response =
                await fetch(
                    "/api/contact",
                    {

                        method: "POST",

                        headers: {

                            "Content-Type":
                                "application/json"

                        },

                        body:
                            JSON.stringify({
                                name: name
                            })

                    }
                );


            // Convert response to JSON

            const data =
                await response.json();


            // Display response

            result.textContent =
                data.message;


            // Change result style

            if (data.success) {

                result.className =
                    "result success";

                input.value = "";

            } else {

                result.className =
                    "result error";

            }


        } catch (error) {

            result.textContent =
                "Could not connect to Flask.";

            result.className =
                "result error";

        }

    }
);