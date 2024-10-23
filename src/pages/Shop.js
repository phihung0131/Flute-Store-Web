import Footer from "../components/common/Footer";
import Header from "../components/common/Header";
import FilterSidebar from "../components/Shop/FilterSidebar";
import ProductsList from "../components/Shop/ProductsList";
import { useState } from "react";

const Shop = () => {
  const [filters, setFilters] = useState({
    sort: "Phù hợp với bạn",
    priceRange: [0, 1000],
    searchTerm: "",
  });

  const handleFilterChange = (newFilters) => {
    setFilters(newFilters);
  };

  return (
    <div>
      <Header />
      <main className="flex-1 pt-[80px]">
        <div className="container mx-auto px-4">
          <div className="flex flex-col md:flex-row gap-6">
            <aside className="md:w-64 flex-shrink-0">
              <FilterSidebar onFilterChange={handleFilterChange} />
            </aside>
            <div className="flex-1">
              <ProductsList filters={filters} />
            </div>
          </div>
        </div>
      </main>
      <Footer />
    </div>
  );
};

export default Shop;
