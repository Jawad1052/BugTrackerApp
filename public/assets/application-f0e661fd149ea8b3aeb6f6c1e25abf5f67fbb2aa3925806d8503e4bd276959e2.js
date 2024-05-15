// Place this code in a JavaScript file that's loaded on your view
$(document).ready(function() {
    $('.delete-bug-btn').on('click', function() {
        var $button = $(this); // Cache the button element
        var $result;
        var bugId = $button.data('bug-id');
        if (confirm('Are you sure you want to delete this bug?')) {
            $.ajax({
                url: '/bugs/' + bugId + '/delete_bug',
                method: 'DELETE',
                success: function(response) {
                    result = response;
                    if (response.success) {
                         alert(response.message);
                        // Remove the deleted bug element from the DOM
                        // $button.closest('.bug-container').remove();
                    } else {
                        alert(response.message);
                    }
                },
                error: function(xhr, status, error) {
                    alert('Failed to delete bug. Please try again later.');
                }
            });
            console.log("nnnnnnnnnnnnnn");
        }
    });
});


$(document).ready(function() {
    // Handle click event for the update button
    $('#update-bug-btn').on('click', function() {
        // Get the bug ID from the button's data attribute
        var bugId = $(this).data('bug-id');

        // If you have fields that users can update, you can get their values here

        // Perform an AJAX request to update the bug
        $.ajax({
            url: '/bugs/' + bugId,
            method: 'PATCH', // Use PATCH method for updates
            data: {
                // Include any updated fields here if needed
            },
            success: function(response) {
                // Handle success response
                if (response.success) {
                    alert(response.message);
                    window.location.reload(); // Refresh the page to see updates
                } else {
                    alert(response.message);
                }
            },
            error: function(xhr, status, error) {
                // Handle error
                alert('Failed to update bug. Please try again later.');
            }
        });
    });
});
