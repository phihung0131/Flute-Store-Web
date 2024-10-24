import React, { useState, useEffect } from "react";
import ReviewItem from "./ReviewItem";

const Review = (props) => {
  const [reviews, setReviews] = useState([]);
  const [newReview, setNewReview] = useState({ text: "", rating: 0 });

  useEffect(() => {
    setReviews(
      props.feedbacks.map((feedback) => ({
        name: "Member " + feedback.memberId,
        text: feedback.comment,
        rating: feedback.rating,
      }))
    );
  }, [props.feedbacks]);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewReview({ ...newReview, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setReviews([
      ...reviews,
      { ...newReview, name: "Anonymous", time: "Just now" },
    ]);
    setNewReview({ text: "", rating: 0 });
  };

  return (
    <div className="my-16 shadow-[0_2px_10px_-3px_rgba(6,81,237,0.3)] p-6 p-4 lg:max-w-5xl max-w-lg mx-auto ">
      <h3 className="text-xl font-bold text-gray-800">
        Reviews({reviews.length})
      </h3>
      <div className="mt-4">
        {reviews.map((review, index) => (
          <ReviewItem key={index} {...review} />
        ))}
        <form onSubmit={handleSubmit} className="mt-6">
          <textarea
            name="text"
            value={newReview.text}
            onChange={handleInputChange}
            className="w-full p-2 border border-gray-300 rounded mt-2"
            placeholder="Write your review..."
            required
          />
          <div className="flex items-center mt-2">
            <label className="mr-2">Rating:</label>
            <select
              name="rating"
              value={newReview.rating}
              onChange={handleInputChange}
              className="border border-gray-300 rounded"
            >
              {[1, 2, 3, 4, 5].map((num) => (
                <option key={num} value={num}>
                  {num}
                </option>
              ))}
            </select>
          </div>
          <button
            type="submit"
            className="w-full mt-4 px-4 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded"
          >
            Submit Review
          </button>
        </form>
      </div>
    </div>
  );
};

export default Review;
