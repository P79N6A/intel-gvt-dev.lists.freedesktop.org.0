Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp5577188ywb;
        Tue, 26 Mar 2019 22:00:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzqqneqKkmbMoO1vBbT1+Nk0NZXzfqVLLnnR/Y2gBtTCbMnmww7yWyZ50L0P6+bpDvNFwFw
X-Received: by 2002:a17:902:e701:: with SMTP id co1mr35216476plb.61.1553662831075;
        Tue, 26 Mar 2019 22:00:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553662831; cv=none;
        d=google.com; s=arc-20160816;
        b=jXgr6NW+w0T0AeZ71T/TbtRi7FN3HSG7EoRdDluYxzP01jPWjptYObXSxhj62MOQXG
         o71cGbliAjc5J/cGU/V8YJxuPJ6a7tkHYP8whByW1i/4DfSozpjDc0i0WkmBYQxSJdoy
         nkC8P+y1BavXdQYCxw4OpJGzIlY/weE4nrAs9gIILS4NwhoS2GM7qPfS/ssv66L2uS68
         CKbPz9vKSgzVUDsYOdamoOqFQS0tyoKWh0tSk1fI5uyhpWt42pBcBZWIGJfXml0Ok5m6
         hw8GnUox2r/8vrp2wDarwF1kru+yGczzSMBgsRxbTW2Khf6J4+u+5/p5vKDRTEaYrIzM
         oXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=PJ12OojZnbxiPo757oH8P9ZcJFCuhj7Rm/qRFYhSewY=;
        b=eaUV3V3gUKqydspF4hg6GK6NUbkmxRfs3Tqq6JCUiwYgBcgGUzKksquw7djPT2j2UD
         uFfLkKb8U5hxnJejd8WmyvBkXcwWPaBd7e1q82QriDplYs8cAmV/7cFk25yccKQZu7kW
         ojWO2X9GbIk88FAaXRkNqrxGAWqYlIoVNplN5lbgVVZFcMw5R0kyOpyP9smYg43i/EgS
         cZ7xuAR+2kLWWQBOcdQROHBv+CWl0fB2uAvJ1k769xGVG6pSGQGmw3rMlb5AqzDohh1I
         mZgsu+0fDfR0zVfn8CDN1Q+4jD03wu8enA+C66pxd5s2r188bgRvgZSyy1lIlDagKEqL
         UGlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f131si18027505pfc.92.2019.03.26.22.00.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2019 22:00:31 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102B06E08B;
	Wed, 27 Mar 2019 05:00:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56AC6E08B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Mar 2019 05:00:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Mar 2019 22:00:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,275,1549958400"; d="scan'208";a="128989361"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga008.jf.intel.com with ESMTP; 26 Mar 2019 22:00:24 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/gvt: do not deliver a workload if its
 creation fails
Date: Wed, 27 Mar 2019 00:54:51 -0400
Message-Id: <20190327045451.15970-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com,
 stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aW4gd29ya2xvYWQgY3JlYXRpb24gcm91dGluZSwgaWYgYW55IGZhaWx1cmUgb2NjdXJzLCBkbyBu
b3QgcXVldWUgdGhpcwp3b3JrbG9hZCBmb3IgZGVsaXZlcnkuIGlmIHRoaXMgZmFpbHVyZSBpcyBm
YXRhbCwgZW50ZXIgaW50byBmYWlsc2FmZQptb2RlLgoKdjI6IGFkZCBmaXhlcyB0YWcgYW5kIGNj
IHN0YWJsZSBrZXJuZWwgKHpoZW55dSB3YW5nKQoKRml4ZXM6IDZkNzYzMDM1NTNiYSAoImRybS9p
OTE1L2d2dDogTW92ZSBjb21tb24gdkdQVSB3b3JrbG9hZCBjcmVhdGlvbiBpbnRvCnNjaGVkdWxl
ci5jIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIzQuMTkrCkNjOiB6aGVueXV3QGxpbnV4
LmludGVsLmNvbQpTaWduZWQtb2ZmLWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIHwgNSArKystLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvc2NoZWR1bGVyLmMKaW5kZXggYzJlM2Q3YmNhYzgyLi44YWZmOTdkZTJjMDEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKQEAgLTE1MDMsOCArMTUwMyw5IEBAIGlu
dGVsX3ZncHVfY3JlYXRlX3dvcmtsb2FkKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBpbnQgcmlu
Z19pZCwKIAkJaW50ZWxfcnVudGltZV9wbV9wdXRfdW5jaGVja2VkKGRldl9wcml2KTsKIAl9CiAK
LQlpZiAocmV0ICYmICh2Z3B1X2lzX3ZtX3VuaGVhbHRoeShyZXQpKSkgewotCQllbnRlcl9mYWls
c2FmZV9tb2RlKHZncHUsIEdWVF9GQUlMU0FGRV9HVUVTVF9FUlIpOworCWlmIChyZXQpIHsKKwkJ
aWYgKHZncHVfaXNfdm1fdW5oZWFsdGh5KHJldCkpCisJCQllbnRlcl9mYWlsc2FmZV9tb2RlKHZn
cHUsIEdWVF9GQUlMU0FGRV9HVUVTVF9FUlIpOwogCQlpbnRlbF92Z3B1X2Rlc3Ryb3lfd29ya2xv
YWQod29ya2xvYWQpOwogCQlyZXR1cm4gRVJSX1BUUihyZXQpOwogCX0KLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
