Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3351979ywo;
        Tue, 23 Apr 2019 05:05:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5v6JOiZSH8UV2XlqAFfp8PkeEIvdCSb+v8wNGOzVwx8wBIn9oMv5vOtbb9xCOKitBLQTj
X-Received: by 2002:a63:84c7:: with SMTP id k190mr24238447pgd.255.1556021142447;
        Tue, 23 Apr 2019 05:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556021142; cv=none;
        d=google.com; s=arc-20160816;
        b=v2O7mg4XH8dqqFYnlGX25zGVpIK7b6TZxFiMmwy3B0sJ1+VUCGd4ZPAziEFBBBDW3Y
         sm2Qmnhp3TrbSvXZ2Ob8zmPqsizdKJ/h9EsvbWNdix2FWvnUDHFUdO8ias1+8wa1ISts
         4mTrPLbA+aVji0puTt5Jz4QL2ADCFs1s5/fJzUgeUJ2LJWz/1f6cyhHG5tum8MCQtkDD
         NO5Pd1zpb75Qd+kbbqZ33zejCm+ELFU9Kc0QlWbFBDypg9mPQYlWd6s3Nn5egyEcGVzr
         WDjyjOvqYl3OMfXvFaSA7ys9ck0fibBj51GhOsQ7PkTGxo/bh0Mqxbt0aCrfOPOMx1hB
         2tpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=piQo02gypLQoh6F1WTDu1BTmxqewVxmKfhpFCvEuOoU=;
        b=Y7k4wBb/2gcbqmMzkRjvl7Sk+VGwTy2PoxvBkNV3shxb2a73r/TB9+PMlwGRkHB6FH
         DtS6VCjmSUmjTdL4QEXreANbJ1pHdZauyVvcOlxpDzymdzT8E38gZq6NKl4u4AInSBxg
         d1S/nm7kWYFfxIBwD9IVyF9ZljRQEFgG8edQ5vBxH9L+AkIyJl2zXl2GLG8PlJim5R6s
         YUYby8yy+pTA6hyTt+7VWVXSfXJyCPVxRc6NxSAxPP6AHbVKVWPw+imHBnFysLXjVXsL
         /hMH46y0Cord+jpVN/ErfIHrcGBKeXv3zzRH4RhJeleYgw4pN4pk52wMT/psxHwlEpvs
         xWig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id o15si12644899pgf.105.2019.04.23.05.05.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 05:05:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C18A89321;
	Tue, 23 Apr 2019 12:05:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2AE8928D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 12:05:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 05:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,385,1549958400"; d="scan'208";a="340002236"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2019 05:05:38 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 3/6] drm/i915/gvt: Use snprintf() to prevent possible
 buffer overflow.
Date: Tue, 23 Apr 2019 15:04:10 +0300
Message-Id: <20190423120413.30929-4-aleksei.gimbitskii@intel.com>
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
