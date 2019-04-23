Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3351970ywo;
        Tue, 23 Apr 2019 05:05:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxa/+oIvO9ux1L25WmXUOq3HtWzl2nVXayMUHePX0jDXbeADD2jNeH1zd5D3+HPq/LV1r3r
X-Received: by 2002:a63:ff26:: with SMTP id k38mr24323910pgi.123.1556021142101;
        Tue, 23 Apr 2019 05:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556021142; cv=none;
        d=google.com; s=arc-20160816;
        b=xUcvyBf3706XwhHFkjCfVNp89u7/xlp32LEWqNhrOxqeBU2BqDSp1e0Y4zN05gGvFq
         yRlERyR8XBxNM7kgkCMQMDUvl+KEvuRvhy1Y7/F4l6Kd0L+mOgbJgIxHelQD7dDEaeCn
         gnRG7MOCbqEEGbqk5tuf8ucA4+7E8Tta9QbiHMV7UbAmsKesTo5+nqJXsDtDjwGSRmJ4
         ftbSmFavOaQ8EJOkwYt1mjC+4AICX0urSMhGO714cb0ktiMqDXMbxlJbnuHrGCQ4pfyP
         uCapAGW1UdOBl0iKKd+chvSeZBQdF1XAgjQgk23i5E8BmxAO8UHgbWzQGPDcmb8RH52G
         CMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=hLCm1TQQOJCOoTsQX7qdmkueCFELpFS63wVT8/1WnH8=;
        b=kJytEAZ3+Nvq/lWpd3HtV1/mJmcsquLyM/sMOvFcMAoQZilhzabAg++4UtXV4uk2fv
         byPHEjqGVnLN0IFWTFNDGSrDGdPM5miR3/3aMKORLA9FiaZpNcZE/rk+rR5y5bhwgISD
         VxZFhzyXeF8+a+kJYHUqKn63fI19Kr4uuYs8Z4lXWumUD0229fa6sAX5KHfyzIxAV3kC
         KQUELnPPidR9XyL/wagpZyRe6m+wDnPjD1RCkaXlsy76cQQCa16RpOUkFw2jy8adrqHt
         XFM4zKO/naFaZe/pbsV3egpxmGAj02Gbw9baa71GHcCq7WAAfNMS2rt1BYH6GS2zcsMa
         l4BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f12si16326675pfh.257.2019.04.23.05.05.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 05:05:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8088928D;
	Tue, 23 Apr 2019 12:05:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC208928D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 12:05:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 05:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,385,1549958400"; d="scan'208";a="340002241"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2019 05:05:39 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 4/6] drm/i915/gvt: Check if cur_pt_type is valid
Date: Tue, 23 Apr 2019 15:04:11 +0300
Message-Id: <20190423120413.30929-5-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
References: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
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
Z3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKaW5kZXggNzYwMDQxNmRiOTA4
Li4wNjE0OTlhMzhmNGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKQEAgLTk0Miw3ICs5NDIsMTYg
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
