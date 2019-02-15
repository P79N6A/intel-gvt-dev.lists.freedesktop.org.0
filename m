Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp374464ywa;
        Fri, 15 Feb 2019 00:51:35 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYzp+5kuzN7XMyrSJL5tq/6VvXUjGCaLBbW3UzZjTGmYOK+PULWH6tWrxqo9WhLfFZ7p7tE
X-Received: by 2002:a63:1e17:: with SMTP id e23mr4310843pge.130.1550220695866;
        Fri, 15 Feb 2019 00:51:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550220695; cv=none;
        d=google.com; s=arc-20160816;
        b=p6V3drg6vKPouUEO/plZPwDQ2uCF6uXCQAo7Hjehkm8/GzU/UlGmVcNSCoHjxe4z7i
         Nw6i3eaSN0ee8xaBzr4tXEPFBNi0ECc0uew8rmMBW9tiP3ipzc4lGO0wUE4++V3Plb1g
         /aBiXPcdBU1PLErwYg/ko3G5YhU/q95FtIgWUA9KwXDU0+KB/AC3XrSFhbLfzV5To4bo
         dq4DH3PEBCQODsGfoDCaomrojdDNsABQEwBqhJ0qauJoFefIjRGpfq7pA9DbEnnERBQ2
         jZA+Y4MzIVv9+Qc8dg+1xI23X8hzF1aVoj1G4fiAsycPj4wMn64kJye2LN+/eFrwI/HE
         8KcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=cJJbqKOFvKm5CjBzH8faJfLiEcZh8Gz1pp1w/VXPmQY=;
        b=ayCBWVz0tw/EfwSC74eu5oBQhNQYu0aGLRDwF7wU/9jI2i9R7nG8yoxs2O4FDKwwfV
         IK5lDZnVKpazvwGd+QLOuk0KI27V7TB5ODmGcE3QY8Bk0P9bTEvoUsXpVw9fyWSG9XkB
         8oOwK5R+P5K8kH1jHRjIF+r2g2ovSP+5jQsevTNi1SLvoDKlf//2QYA2i+OiOemDPlbA
         +0xHCuI47Xtu9m/X8iybFquvpfzDBEFhMP7XMU0bAdo9XkC4TgNXLM7rYMbITbLUmvg7
         T60COkF7fJD/YGs7cFSxflTgOeUoVusEvEOUi4TfwJf9caUdK0nL5K+m/ft1dKhbfjm9
         s43A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g26si2264625pfi.184.2019.02.15.00.51.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Feb 2019 00:51:35 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768456EACE;
	Fri, 15 Feb 2019 08:49:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16266E058
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 15 Feb 2019 01:56:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2019 17:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,371,1544515200"; d="scan'208";a="134457907"
Received: from hm-optiplex-9020.sh.intel.com (HELO
 byang1217-clrdev:22530_v2.sh.intel.com) ([10.239.154.42])
 by orsmga002.jf.intel.com with ESMTP; 14 Feb 2019 17:56:23 -0800
From: Min He <min.he@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] Makefile: adding profiling option in Makefile
Date: Fri, 15 Feb 2019 01:42:04 +0000
Message-Id: <20190215014204.6650-2-min.he@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190215014204.6650-1-min.he@intel.com>
References: <20190215014204.6650-1-min.he@intel.com>
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
Cc: Min He <min.he@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRlZCBhIG9wdGlvbiB0byBjb250cm9sIHByb2ZpbGluZyBvbi9vZmYsIGJ5
IGRlZmF1bHQsCnByb2ZpbGluZyBpcyBvbiwgc28gdGhhdCBWVHVuZSBjYW4gYmUgdXNlZCB0byBj
YXB0dXJlIHBlcmYgZGF0YSBmcm9tClNPUy4KV2hlbiBydW5uaW5nOiBtYWtlIFBST0ZJTElORz0w
LCBpdCB3aWxsIGRpc2FibGUgcHJvZmlsaW5nIGFuZCBwbXUgd2lsbApiZSBwYXNzLXRocnUgYW5k
IHBlcmYgdG9vbHMgY2FuIGJlIHJ1biBkaXJlY3RseSBpbnNpZGUgVU9TLgoKU2lnbmVkLW9mZi1i
eTogTWluIEhlIDxtaW4uaGVAaW50ZWwuY29tPgotLS0KIGh5cGVydmlzb3IvTWFrZWZpbGUgfCA3
ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9oeXBlcnZpc29yL01ha2VmaWxlIGIvaHlwZXJ2aXNvci9NYWtlZmlsZQpp
bmRleCA0ZmJkNzViOS4uODIzY2E3YTYgMTAwNjQ0Ci0tLSBhL2h5cGVydmlzb3IvTWFrZWZpbGUK
KysrIGIvaHlwZXJ2aXNvci9NYWtlZmlsZQpAQCAtMzIsNiArMzIsOCBAQCBBUkNIX0FTRkxBR1Mg
Oj0KIEFSQ0hfQVJGTEFHUyA6PQogQVJDSF9MREZMQUdTIDo9CiAKK1BST0ZJTElORyA/PSAxCisK
IC5QSE9OWTogZGVmYXVsdAogZGVmYXVsdDogYWxsCiAKQEAgLTI2Niw3ICsyNjgsMTAgQEAgZW5k
aWYKIAogQ19PQkpTIDo9ICQocGF0c3Vic3QgJS5jLCQoSFZfT0JKRElSKS8lLm8sJChDX1NSQ1Mp
KQogaWZuZXEgKCQoQ09ORklHX1JFTEVBU0UpLHkpCi1DRkxBR1MgKz0gLURIVl9ERUJVRyAtRFBS
T0ZJTElOR19PTiAtZm5vLW9taXQtZnJhbWUtcG9pbnRlcgorQ0ZMQUdTICs9IC1ESFZfREVCVUcg
LWZuby1vbWl0LWZyYW1lLXBvaW50ZXIKK2lmZXEgKCQoUFJPRklMSU5HKSwgMSkKK0NGTEFHUyAr
PSAtRFBST0ZJTElOR19PTgorZW5kaWYKIGVuZGlmCiBTX09CSlMgOj0gJChwYXRzdWJzdCAlLlMs
JChIVl9PQkpESVIpLyUubywkKFNfU1JDUykpCiAKLS0gCjIuMTcuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
