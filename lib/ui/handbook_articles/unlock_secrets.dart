import 'package:flutter/material.dart';
import 'package:tarot/ui/handbook_articles/article_base.dart';

import 'article_text_widgets.dart';

class UnlockingSecrets extends ArticleBase {
  UnlockingSecrets({Key? key})
      : super(
          key: key,
          routeName: '/unlock_secrets',
          title: 'Unlocking Secrets with the Tarot',
          contents: [
            ArticleBodyText(
              '''Are important secrets about your past, present, and future lurking in the shadows? Find out what they are quickly and easily with the help of the Tarot!

The Tarot is an incredible tool that can shed light into the darkest corners of your life. These amazing cards make it possible to illuminate and bring to light what you have never been able to see before.''',
            ),
            SizedBox(height: 8.0),
            Align(
              child: ArticleHeadlineText(
                'Revealing the unknown',
              ),
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''What do you want to know? Does something irk you but you can not seem to find the source? Are you ready to shake that nagging suspicion that something is not quite right under the surface? Unseen secrets can be uncovered by using the all powerful Tarot.

This could be your opportunity to no longer feel afraid to the unknown. It's not so hard to figure out what is really happening in your life. The missing piece of the jigsaw puzzle may be just the flip of a card away.

Listen to your gut and ask yourself a difficult question. Is there a person or people in your life who you suspect are keeping secrets from you? Aren't you tired of sorting through shady behavior, half-truths, deception, and disloyal words?''',
            ),
            SizedBox(height: 8.0),
            Align(
              child: ArticleHeadlineText(
                'Questions and answers',
              ),
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''Consult the Tarot for honest answers. Remove the wool from your eyes so that you can see what your situation really is like and become more in tune with the reality around you. You need to know the whole story, not just the version others want you to know.

When it comes to knowing what is up in your world, you are not just left to your own devices. No one can be everywhere, all the time. Even with today's modern technology, the Tarot is still the best private investigator. Why? Agendas, motivations, and plans become clear and easy to spot with the cards.

With the Tarot acting as a skeleton key to the closet that holds all the secrets in your life, you never have to worry, wonder, or feel powerless against the unseen energies of the universe. Like a homing device, the Tarot can help pinpoint the true, honest aspects of your concerns so that you can focus on solutions.

Does anyone in your life speak to you as though they are censoring what they say? When they share things with you does it sound as though they are using security software for their words? This is a red flag indicating a hidden wealth of secrets, carefully woven into a web of exclusion.''',
            ),
            SizedBox(height: 8.0),
            Align(
              child: ArticleHeadlineText(
                'Get the inside story',
              ),
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''When you consult with the Tarot you have a chance to get the most privileged information about the people in your life: employer/employees, friends, family, lover, boyfriend/girlfriend, husband/wife, landlord, accountant, roommate, and anyone else who might be keeping an impactful secret from you! No matter whether they are trying to keep secrets from you because they love you and think it is best for you to be left in the dark on a particular matter, or because they are wishing you ill-will or want to put you at a disadvantage in life, the fact of the matter is they are still hiding a secret from you. Is whispering in the other room and their hush-hush attitude got your sixth sense tingling? Is cloak and dagger behavior leading you to wonder what is so private and under wraps? It is human nature to be curious!

It is time to expose the truth and unlock the answers. Ask and you shall know with the power of the Tarot!''',
            ),
          ],
        );
}
