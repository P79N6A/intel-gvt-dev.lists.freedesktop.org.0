Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp3312368ywb;
        Mon, 25 Mar 2019 00:09:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyZGxVUcbCgfvDzVREE3irFqYfMAG/8KZ2J2Md2mszuCFHhlKTDoaXKbuv0//cKzSkwfbxr
X-Received: by 2002:a17:902:2bab:: with SMTP id l40mr23606664plb.273.1553497787579;
        Mon, 25 Mar 2019 00:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553497787; cv=none;
        d=google.com; s=arc-20160816;
        b=oqsC6sHqE8tRRFjr55Id6gCcYFw16+OPR7rw9LKqmBvoxfg8gx4B/9TxGsypc3FcNx
         +UfI4/wW8HNvRNSR2zFMZlk8Pto0XFwPWtU+E6wxsMYiKhYEEjCfzoPjF0drM+7AJ0g5
         N7+5et7vsfQJAt5FS3XdfXf/Q9bddfF7CSWhk6VreuURU+4N/UJC8jkTPge1NCJmnRJ+
         dXqVNWBYxb+q/tKw2AWYcGw+wpdSzR1bUGAQAlnAi30CU32q9mPDDC+oPVX4Dw+88AJy
         gQyyxUwmPt7bDXKZ+U2nJWWBbqD7nVhomVuKnhyxzDe+T0tAU5z465/m8CLmbHvhvb2w
         Vbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=HetmYMFGsUdJyLfbLYU64E7O/udczTu0dqijIIsd9FY=;
        b=i6NAOt6juzulvh3E9aXleXFL4RCQs7GsPCh5bZ8MTmW+cuiGmXVupUT6Zp2tGtw9E/
         ZHjwLSMbRkfusk6PvHws9bzXBXFjsdQGM7DRluizQBjQV6w2zJfwkyc+YBQy2Oo+cX35
         7P+Ovlt4DM9irqYip1vVX/IJm6Q0u03ZLdUzts0a0LMvxo0FQtpOXdmgMi90Tt8A7kMW
         7t6L7GmQkQtZUCpEnVypyy+X2nVzYMTwTYj12y0ygYXwTW6Jjkonu0AbqIRnV8thU+ar
         scI7rDMLgvAY+nnxX0pqTThxC5mv945IQAwFSpeTSH37XpPDN+eR6pRK2UMT42ITAKeh
         ceCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id d19si12781700pgk.115.2019.03.25.00.09.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 00:09:47 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325646E655;
	Mon, 25 Mar 2019 07:09:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E3D6E655
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Mar 2019 07:09:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Mar 2019 00:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; d="scan'208";a="155496760"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga004.fm.intel.com with ESMTP; 25 Mar 2019 00:09:44 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: support MI_SEMAPHORE_WAIT
Date: Mon, 25 Mar 2019 03:04:11 -0400
Message-Id: <20190325070411.16113-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190325061514.25338-1-yan.y.zhao@intel.com>
References: <20190325061514.25338-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

cmVjZW50IGk5MTUgZHJpdmVyIHVzZXMgTUlfU0VNQVBIT1JFX1dBSVQgdG8gc3luYyByZXF1ZXN0
cy4KR1ZULWcgc2hvdWxkIGFkZCBzdXBwb3J0IGZvciB0aGlzIGNvbW1hbmQsIG90aGVyd2lzZSBp
OTE1IGd1ZXN0IHdvdWxkIGZhaWwKaW4gY21kIHBhcnNlciBhbmQgY2F1c2UgZ3Vlc3QgVk0gZmFp
bHVyZQoKdjI6IHJlZmluZSBjb21taXQgbWVzc2FnZSAoemhlbnl1IHdhbmcpCgpTaWduZWQtb2Zm
LWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKaW5kZXggYTE2ZTUyN2U5ZjAyLi5lOThmMGEwZDMwODMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwpAQCAtMTUzOCw3ICsxNTM4LDMw
IEBAIHN0YXRpYyBpbnQgY21kX2hhbmRsZXJfbWlfc3RvcmVfZGF0YV9pbW0oc3RydWN0IHBhcnNl
cl9leGVjX3N0YXRlICpzKQogCiBzdGF0aWMgaW50IGNtZF9oYW5kbGVyX21pX3NlbWFwaG9yZV93
YWl0KHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSAqcykKIHsKLQlyZXR1cm4gdW5leHBlY3RlZF9j
bWQocyk7CisJdW5zaWduZWQgbG9uZyBnbWEsIGdtYV9oaWdoOworCWludCByZXQgPSAwOworCWlu
dCBjbWRfbGVuID0gY21kX2xlbmd0aChzKTsKKwlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSA9IHMt
PnZncHU7CisJaW50IGdtYV9sZW4gPSBzaXplb2YodTMyKTsKKworCWlmIChjbWRfbGVuICE9IDQg
JiYgY21kX2xlbiAhPSA1KSB7CisJCWd2dF92Z3B1X2VycigiSWxsZWdhbCBjbWQgbGVuZ3RoICVk
XG4iLCBjbWRfbGVuKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJLyogcHBndHQgaXMgYWx3
YXlzIHNhZmUgKi8KKwlpZiAoIShjbWRfdmFsKHMsIDApICYgKDEgPDwgMjIpKSkKKwkJcmV0dXJu
IHJldDsKKworCWdtYSA9IGNtZF92YWwocywgMikgJiBHRU5NQVNLKDMxLCAwKTsKKwlpZiAoY21k
X2xlbiA9PSA1KSB7CisJCWdtYV9oaWdoID0gY21kX3ZhbChzLCAzKSAmIEdFTk1BU0soMzEsIDAp
OworCQlnbWEgPSAoZ21hX2hpZ2ggPDwgMzIpIHwgZ21hOworCQlnbWFfbGVuID0gc2l6ZW9mKHU2
NCk7CisJfQorCXJldCA9IGNtZF9hZGRyZXNzX2F1ZGl0KHMsIGdtYSwgZ21hX2xlbiwgZmFsc2Up
OworCXJldHVybiByZXQ7CisKIH0KIAogc3RhdGljIGludCBjbWRfaGFuZGxlcl9taV9yZXBvcnRf
cGVyZl9jb3VudChzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUgKnMpCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
