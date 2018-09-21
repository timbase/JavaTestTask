package ru.javarush.timb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.javarush.timb.model.entity.Part;
import ru.javarush.timb.service.PartService;

import java.util.List;

@Controller
public class PartController {
    private PartService partService;
    private static String currentParam = "all";
    private static Integer currentPage = 1;

    @Autowired
    @Qualifier(value = "partService")
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @RequestMapping(value = "/parts/update", method = RequestMethod.POST)
    public String updatePart(@ModelAttribute("part") Part part) {

        this.partService.updatePart(part);

        return "redirect:/parts";
    }

    @RequestMapping(value = "/parts/add", method = RequestMethod.POST)
    public String addPart(@ModelAttribute("part") Part part) {

        this.partService.addPart(part);

        return "redirect:/parts";
    }

    @RequestMapping("/remove/{id}")
    public String removePart(@PathVariable("id") int id) {
        this.partService.removePart(id);

        return "redirect:/parts";
    }

    @RequestMapping("/edit/{id}")
    public ModelAndView editPart(@PathVariable("id") int id) {

        ModelAndView modelAndView;

        if (id != 0) {
            modelAndView = new ModelAndView("update");
            modelAndView.addObject("update", this.partService.getPartById(id));
        } else {
            modelAndView = new ModelAndView("add");
            modelAndView.addObject("add", new Part());
        }

        return modelAndView;
    }


    @RequestMapping(value="/parts")
    public ModelAndView listOfParts(@RequestParam(required = false) Integer page,
                                    @RequestParam(required = false) String param) {
        ModelAndView modelAndView = new ModelAndView("parts");

        if (page!=null) {
            currentPage = page;
        }

        if (param != null) {
            if (param.equals("")) {
                param = "all";
            }
            currentParam = param;
            currentPage = 1;
        }

        int availableComputers = countComputers();

        modelAndView.addObject("availableComputers", availableComputers);


        List<Part> parts = partService.listParts(currentParam);

        PagedListHolder<Part> pagedListHolder = new PagedListHolder<>(parts);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(currentPage == null || currentPage < 1 || currentPage > pagedListHolder.getPageCount()){
            currentPage=1;
        }
        modelAndView.addObject("page", currentPage);
        if(currentPage == null || currentPage < 1 || currentPage > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("listParts", pagedListHolder.getPageList());
        }
        else if(currentPage <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(currentPage-1);
            modelAndView.addObject("listParts", pagedListHolder.getPageList());
        }

        return modelAndView;
    }

    private int countComputers() {
        List<Part> needParts = partService.listParts("needOnly");
        int count = 0;
        if (!needParts.isEmpty()) {
            count = needParts.get(0).getAmount();
            for (Part part : needParts) {
                if (part.getAmount() < count) {
                    count = part.getAmount();
                }
            }
        }

        return count;
    }
}
