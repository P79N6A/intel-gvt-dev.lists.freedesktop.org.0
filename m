Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6746302ywo;
        Thu, 11 Apr 2019 03:47:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHGSajjb2bXUrR/YO2hKcW42wzMuxK+zuDz+VnoWqVAhExxN5dMidKh9VZIGt8ld/LIb9n
X-Received: by 2002:a63:6cc7:: with SMTP id h190mr47074244pgc.350.1554979651346;
        Thu, 11 Apr 2019 03:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554979651; cv=none;
        d=google.com; s=arc-20160816;
        b=uFPZUK9OHDFqAQ/kaV4znlizX2S1A1EMAA3TdtVkACINFVsUA6OM8SvWGqrYQc0rEf
         6myCaVMtm89xpjZ1AwJhTsToyKs4SguEaynljRwfORcpL9FTh6blSBU3NHzM1zS79vqs
         AEK62IZx1cZXgBRVSGLuF+GLA2y9ElceFhdSezW9CepGxNFAL03VJVZXWeQfwUzPui+9
         hVGmgaq3wEHT9l8cXGCeNO1ABp8kcbhNcFIsIvi2yqBW86mEAWsb2aLu8zqt8Z82BBoY
         43a704Z2PZoQIxU3vw44BkRKK9C8RRvEbcPG9UCuzkn4x3Zkeq37DPpSb1wkMmWsSeC9
         /l9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=piQo02gypLQoh6F1WTDu1BTmxqewVxmKfhpFCvEuOoU=;
        b=IU1bSD3/Bku2ndZiPA0ANpsddps8opdl2Jn5JOA+WwnzO7srxQX9WeovrIEjt2g/hI
         5cvHMHJaeey9NA5jhHD172vGy0q4S72j/QcXH8U5uasEIRC+0Gonh/AnayzxrdyEwVSN
         P+vJOG6/Jo0o9QlBmv9JEqABktlMBHY/Mtd3wQJjQ80V650L2EK0SAg380QCnw+C5Gjv
         ySA2ERTxE1b0PA2YKwh9m9lUkZW2FDgDKcH0mkutr+Ai4lde/+Js4foAd1i5ikltUOyy
         TaqGOhAWaQl2NErxW4AG5IrN7uaUBwJE40vRiBQ/GoIOE1OLmqqZlVi9VR6nRfJI4Qmu
         ccYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id c12si30224601plr.19.2019.04.11.03.47.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 03:47:31 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0036E89704;
	Thu, 11 Apr 2019 10:47:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F7789704
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2019 10:47:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 03:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,337,1549958400"; d="scan'208";a="160715281"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2019 03:47:27 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2 3/6] drm/i915/gvt: Use snprintf() to prevent possible
 buffer overflow.
Date: Thu, 11 Apr 2019 13:46:28 +0300
Message-Id: <20190411104631.7627-4-aleksei.gimbitskii@intel.com>
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

Rm9yIHByaW50aW5nIHRoZSBpbnRlbF92Z3B1LT5pZCwgYSBidWZmZXIgd2l0aCBmaXhlZCBsZW5n
dGggaXMgYWxsb2NhdGVkCm9uIHRoZSBzdGFjay4gQnV0IGlmIHZncHUtPmlkIGlzIGdyZWF0ZXIg
dGhhbiA2IGNoYXJhY3RlcnMsIHRoZSBidWZmZXIKb3ZlcmZsb3cgd2lsbCBoYXBwZW4uIEV2ZW4g
dGhlIHN0cmluZyBvZiB0aGUgYW1vdW50IG9mIG1heCB2Z3B1IGlzIGxlc3MKdGhhdCB0aGUgbGVu
Z3RoIGJ1ZmZlciByaWdodCBub3csIGl0J3MgYmV0dGVyIHRvIHJlcGxhY2Ugc3ByaW50ZigpIHdp
dGgKc25wcmludGYoKS4KCnYyOgotIEluY3JlYXNlIHRoZSBzaXplIG9mIHRoZSBidWZmZXIuIChD
b2xpbiBYdSkKClRoaXMgcGF0Y2ggZml4ZWQgdGhlIGNyaXRpY2FsIGlzc3VlICM2NzMgcmVwb3J0
ZWQgYnkga2xvY3dvcmsuCgpTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJpdHNraWkgPGFsZWtz
ZWkuZ2ltYml0c2tpaUBpbnRlbC5jb20+CkNjOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5p
bnRlbC5jb20+CkNjOiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+CkNjOiBDb2xpbiBY
dSA8Y29saW4ueHVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1
Z2ZzLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1Z2ZzLmMKaW5kZXggMmVjODliY2I1OWYxLi44
YTk2MDZmOTFlNjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1Z2Zz
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYwpAQCAtMTk2LDkgKzE5
Niw5IEBAIERFRklORV9TSU1QTEVfQVRUUklCVVRFKHZncHVfc2Nhbl9ub25wcml2YmJfZm9wcywK
IGludCBpbnRlbF9ndnRfZGVidWdmc19hZGRfdmdwdShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkK
IHsKIAlzdHJ1Y3QgZGVudHJ5ICplbnQ7Ci0JY2hhciBuYW1lWzEwXSA9ICIiOworCWNoYXIgbmFt
ZVsxNl0gPSAiIjsKIAotCXNwcmludGYobmFtZSwgInZncHUlZCIsIHZncHUtPmlkKTsKKwlzbnBy
aW50ZihuYW1lLCAxNiwgInZncHUlZCIsIHZncHUtPmlkKTsKIAl2Z3B1LT5kZWJ1Z2ZzID0gZGVi
dWdmc19jcmVhdGVfZGlyKG5hbWUsIHZncHUtPmd2dC0+ZGVidWdmc19yb290KTsKIAlpZiAoIXZn
cHUtPmRlYnVnZnMpCiAJCXJldHVybiAtRU5PTUVNOwotLSAKMi4xNy4xCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
SW50ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lu
a2kgCkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVs
c2lua2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZp
ZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGll
bnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2Ug
Y29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBs
aXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
