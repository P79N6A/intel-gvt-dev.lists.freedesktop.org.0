Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp3118190ywb;
        Sun, 24 Mar 2019 18:54:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7KvLn/xCvJK2C0OKCKgxgpBqaTHFT4z3sNB3cqTSs4/ATyqalPXaECYc6U9BI5axOY7b4
X-Received: by 2002:a63:2158:: with SMTP id s24mr12694513pgm.156.1553478847869;
        Sun, 24 Mar 2019 18:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553478847; cv=none;
        d=google.com; s=arc-20160816;
        b=VNTagHY0yBpiDBupUsU6TRpuWug7MtZl6r5xG5sK2S8ZJDIVL2+U/DRhkTWJTR4oa7
         zur96jW/jji5l3+wJNdz3NUSo3vT/v5yn7LIwScPaR+mlgBcYon1ntgGfY9qtXlcO4GA
         VGVVYoPfcFdgjjxSIysOZfbnQMinLgUEsrutp33zUNN4xDEBoPpzOxP5E07ug1VTu45l
         qVLltYAGEu7Q7iS4eolrDzdMlvmAd3tAmx+vmBAmFfsHNI0TNJtYldIl0V8UQUpWU3ae
         gPju8XGZcEc390nO9VcQV/eiqQIk0R14FnCcGBwHzV1DpGtnmqPgWHP11fAi0Y9EgxZa
         2D8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=I8eHr+y4nzxnY7v8dlxhTXkvPxIKyo36xU4ErghCHbQ=;
        b=1LUHMw2r7eAWiZnEP3hRIRd9xD1ih5iXq1V9qsmRPtQS1Q6Hdm3F02F1YWlXm8FreL
         YN6QqSZVcvMHp7WpMMwKSVmWKTgTD9neH5HaIJqYHoottoASvR0iQqGpZiElYgAcZ7GI
         dmPaU5W+u9wd2qu7+XmErs/X3Vx7/3gITqRHWZ+of4N7hklat+sNLlxaGGmyyhIEyii1
         3IthxbqqPHaYXBrYn4JOJmEWdySS4LtRpvPib5xTJL4NSozAWN21PhqkXvFpXJ4lR3F3
         qju2rNW3fK9CvD2+4QIamXyFiKex57jEeMgh0NPGbztTD1nGZhaq4iYevXRkMPR/k+QJ
         LKrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id bg4si12594397plb.238.2019.03.24.18.54.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Mar 2019 18:54:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDA36E60A;
	Mon, 25 Mar 2019 01:54:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C076E60A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Mar 2019 01:54:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Mar 2019 18:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; d="scan'208";a="136943582"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2019 18:54:04 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/i915/gvt: Enable synchronous flip on handling
 MI_DISPLAY_FLIP
Date: Mon, 25 Mar 2019 09:52:16 +0800
Message-Id: <20190325015217.24816-3-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325015217.24816-1-colin.xu@intel.com>
References: <20190325015217.24816-1-colin.xu@intel.com>
MIME-Version: 1.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIEludGVsIEdGWCBQUk0gb24gMDEub3JnLCB0aGUgTUlfRElTUExBWV9GTElQ
IGNvbW1hbmQgY2FuCmVpdGhlciByZXF1ZXN0IGRpc3BsYXkgcGxhbmUgZmxpcCBzeW5jaHJvbm91
c2x5IG9yIGFzeW5jaHJvbm91c2x5LgpJbiBzeW5jaHJvbm91cyBmbGlwLCBmbGlwIHdpbGwgYmUg
aG9sZCB1bnRpbCBuZXh0IHZzeW5jLCB3aGljaAppcyBub3QgaW1wbGVtZW50ZWQgeWV0IGluIEdW
VC4gSW4gYXN5bmNocm9ub3VzIGZsaXAsIGZsaXAgd2lsbCBoYXBwZW4KaW1tZWRpYXRlbHksIHdo
aWNoIGlzIGN1cnJlbnQgaW1wbGVtZW50YXRpb24uCgpUaGUgcGF0Y2ggZW5hYmxlcyB0aGUgc3lu
YyBmbGlwIG9uIGhhbmRsaW5nIE1JX0RJU1BMQVlfRkxJUCwKYW5kIGluY3JlbWVudCBmbGlwIGNv
dW50IGNvcnJlY3RseSBieSBvbmx5IGluY3JlbWVudCBvbiBwcmltYXJ5IHBsYW5lLgoKdjI6ClVz
ZSBiaXQgb3BlcmF0aW9uIGRlZmluaXRpb24gZm9yIGZsaXAgbW9kZS4gKHpoZW55dSkKClNpZ25l
ZC1vZmYtYnk6IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyB8IDEwICsrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9j
bWRfcGFyc2VyLmMKaW5kZXggZDhkNTk2OTU2MTllLi5mY2EzOWY2NzNhOTggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwpAQCAtMTMxNyw4ICsxMzE3LDE0IEBAIHN0YXRpYyBp
bnQgZ2VuOF91cGRhdGVfcGxhbmVfbW1pb19mcm9tX21pX2Rpc3BsYXlfZmxpcCgKIAkJCSAgICAg
IGluZm8tPnRpbGVfdmFsIDw8IDEwKTsKIAl9CiAKLQl2Z3B1X3ZyZWdfdCh2Z3B1LCBQSVBFX0ZS
TUNPVU5UX0c0WChpbmZvLT5waXBlKSkrKzsKLQlpbnRlbF92Z3B1X3RyaWdnZXJfdmlydHVhbF9l
dmVudCh2Z3B1LCBpbmZvLT5ldmVudCk7CisJaWYgKGluZm8tPnBsYW5lID09IFBMQU5FX1BSSU1B
UlkpCisJCXZncHVfdnJlZ190KHZncHUsIFBJUEVfRkxJUENPVU5UX0c0WChpbmZvLT5waXBlKSkr
KzsKKworCWlmIChpbmZvLT5hc3luY19mbGlwKQorCQlpbnRlbF92Z3B1X3RyaWdnZXJfdmlydHVh
bF9ldmVudCh2Z3B1LCBpbmZvLT5ldmVudCk7CisJZWxzZQorCQlzZXRfYml0KGluZm8tPmV2ZW50
LCB2Z3B1LT5pcnEuZmxpcF9kb25lX2V2ZW50W2luZm8tPnBpcGVdKTsKKwogCXJldHVybiAwOwog
fQogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg==
