Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6746317ywo;
        Thu, 11 Apr 2019 03:47:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxhM4dmjaIcT7YYjCrHTFUadU0gh3IvPsXbyUDmJtMFMZns7KCCXBMEbSXuXx18YHFyEyu
X-Received: by 2002:a65:4302:: with SMTP id j2mr44139852pgq.291.1554979652669;
        Thu, 11 Apr 2019 03:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554979652; cv=none;
        d=google.com; s=arc-20160816;
        b=oM6M++8vIx0DNqGPWZN0MG3R5LmI1eFHfvYdkNk5+IPiqC0K/3NU9t2Kvvn4z++8FG
         e90Y0JMoVkK85dhvVHJr1bG+EEFqtVsvEz4oilhCibpu8VFjd/vkUktjNJNjcIaMWr9R
         /8AAdDc43tYE/Db+D/IJVN4luOCG7DFDZxzrYwCwr1QR4jEvz42Xp/41z7lC91pTP5kP
         lhX4ChJd640afJbRK70MX1Au75w4XuDuY0pi+3vtvGvrDsFrHZQonHoPypoVCUf5RYsB
         Trh4leHWoo4VuEdWnr8+69V8YUr4pXl942jIxlHp7a2Od3+kJ3NuXfd03avxrpYrMA7P
         sDiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=GeotOkQui3lIfWHfp7cz8OjXZUlUfihlf32kNT8L4Gg=;
        b=OYZcak7mfKoLyj8nTVW28N8+WT3vdEflqGF+/6ALnvO9Fq4fR1e9AmQkY5EsTAcRK+
         3UZdMq7GD/NCfF1nfxRgpNqmVkNf5JyPsBc1D3X9w1Y2iSNRI0djmrb0qFoMAmTYLjz5
         QGwXGkK60b7XAILgLb+JFbzqbg2ywkeXrQR4n0C1McFPZ+W+YJjs4+u6BIYraxBBNDS/
         Xkg3pvAtYHf+Z4HjxeloatE7Qgk35gYlovFEKx4Z7TCwZ1rS4RT1Drplyu74DPmH3NC+
         mPAo46lV0z45FNmMG6wkdEVM9VQWD1kJ0G3ufPEWoCYPHxdS6TMx5Re8y1EGGWgm1JW8
         eyLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id c14si26830000pls.106.2019.04.11.03.47.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 03:47:32 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA90897E9;
	Thu, 11 Apr 2019 10:47:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E42D89704
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2019 10:47:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 03:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,337,1549958400"; d="scan'208";a="160715289"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2019 03:47:29 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2 4/6] drm/i915/gvt: Check if cur_pt_type is valid
Date: Thu, 11 Apr 2019 13:46:29 +0300
Message-Id: <20190411104631.7627-5-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Colin Xu <colin.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U3RhdGljIGNvZGUgYW5hbHl6ZXIgd2FybnMgdGhhdCBpbmRleCB2YWx1ZSBmb3Igc2NyYXRjaF9w
dCBtYXkgYmUgZXF1YWwKdG8gLTEuIEluZGV4IHZhbHVlIHR5cGUgaXMgaW50ZWxfZ3Z0X2d0dF90
eXBlX3QsIHNvIGl0IG1heSBiZSBhbnkgbnVtYmVyCmF0IHJhbmdlIC0xIHRvIDE3LiBDaGVjayBm
aXJzdCBpZiBjdXJfcHRfdHlwZSBhbmQgY3VyX3B0X3R5cGUrMSBpcyB2YWxpZAp2YWx1ZXMuCgp2
MjoKIC0gUHJpbnQgc29tZSBlcnJvciBtZXNzYWdlcyBpZiBwYWdlIHRhYmxlIHR5cGUgaXMgaW52
YWxpZC4gKENvbGluIFh1KQoKVGhpcyBwYXRjaCBmaXhlZCB0aGUgY3JpdGlhbCBpc3N1ZSAjNDIy
IHJlcG9ydGVkIGJ5IGtsb2N3b3JrLgoKU2lnbmVkLW9mZi1ieTogQWxla3NlaSBHaW1iaXRza2lp
IDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPgpDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdA
bGludXguaW50ZWwuY29tPgpDYzogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPgpDYzog
Q29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmMgfCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKaW5kZXggOGRjYjYyMjNiOTg1
Li5lNDRkZGIzMjhiNGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKQEAgLTkzNiw3ICs5MzYsMTYg
QEAgc3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3NwdF9ieV9zaGFkb3dfZW50cnkoc3RydWN0
IGludGVsX3ZncHUgKnZncHUsCiAKIAlpZiAoZS0+dHlwZSAhPSBHVFRfVFlQRV9QUEdUVF9ST09U
X0wzX0VOVFJZCiAJCSYmIGUtPnR5cGUgIT0gR1RUX1RZUEVfUFBHVFRfUk9PVF9MNF9FTlRSWSkg
ewotCQljdXJfcHRfdHlwZSA9IGdldF9uZXh0X3B0X3R5cGUoZS0+dHlwZSkgKyAxOworCQljdXJf
cHRfdHlwZSA9IGdldF9uZXh0X3B0X3R5cGUoZS0+dHlwZSk7CisKKwkJaWYgKCFndHRfdHlwZV9p
c19wdChjdXJfcHRfdHlwZSkgfHwKKwkJCQkhZ3R0X3R5cGVfaXNfcHQoY3VyX3B0X3R5cGUgKyAx
KSkgeworCQkJV0FSTigxLCAiSW52YWxpZCBwYWdlIHRhYmxlIHR5cGVcbiIpOworCQkJcmV0dXJu
IC1FSU5WQUw7CisJCX0KKworCQljdXJfcHRfdHlwZSArPSAxOworCiAJCWlmIChvcHMtPmdldF9w
Zm4oZSkgPT0KIAkJCXZncHUtPmd0dC5zY3JhdGNoX3B0W2N1cl9wdF90eXBlXS5wYWdlX21mbikK
IAkJCXJldHVybiAwOwotLSAKMi4xNy4xCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgRmlubGFuZCBPeQpS
ZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1c2luZXNzIElkZW50
aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVsc2lua2kgCgpUaGlzIGUtbWFp
bCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBm
b3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcg
b3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3Ug
YXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVy
IGFuZCBkZWxldGUgYWxsIGNvcGllcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
