import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/create_review_bloc.dart';
import '../manager/create_review_state.dart';

class CreateReviewRecommend extends StatelessWidget {
  const CreateReviewRecommend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewBloc, CreateReviewState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Do you recommend this recipe?",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4,),
          Row(
            children: [
              Text(
                "No",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              Radio<bool>(
                value: false,
                groupValue: state.isReco,
                visualDensity: VisualDensity.compact,
                onChanged: (value) {
                  context.read<CreateReviewBloc>().add(
                        SetRecommend(value!),
                      );
                },
              ),
              SizedBox(width: 16,),
              Text(
                "Yes",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              Radio<bool>(
                value: true,
                visualDensity: VisualDensity.compact,
                groupValue: state.isReco,
                onChanged: (value) {
                  context.read<CreateReviewBloc>().add(
                    SetRecommend(value!),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
