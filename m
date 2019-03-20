Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp347327ywb;
        Tue, 19 Mar 2019 23:45:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1SBxhXz2gp7oiif+sZ2ge+A7fxFd98r1KwJxA1+/z+Y13x4YB13sNx08xaLMBopf91MQG
X-Received: by 2002:a63:fd03:: with SMTP id d3mr6101706pgh.359.1553064329565;
        Tue, 19 Mar 2019 23:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553064329; cv=none;
        d=google.com; s=arc-20160816;
        b=ARYJxRcDbKm8nCNlL2B/MkzHvzx4wm3jj0Pl45kcnZnp7g+xIXQj5FN+nesqU0glxI
         buiA6hiSDRWQi/awLWq0icFz2+v2P6lki6c9bcQXLFU0oEzie3H7Bz7576oa+/Zh3F+t
         zyRmEmtWeCZeKkpmfMfCQctOpTp7iUnaRcifJU80om2sr9XPHEkjJ42+WGtc6vtCdDTY
         e4aSS2kS6GSiAuMJyjnWU7TLmSNso/2BOmDfFtL4qVUmUR0VQGbm6eZ9kBzSE4gfd7Co
         vu/AsE2OD8D9DC5EVBle9vcB1sS/+I11fEEI33MGt1Wjgvl3mU/yzqltIUG/q577iBWw
         cbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=6gydBPo5ITW0SrIRBrLAp4PUk83RogA3RvUJXxFOVKY=;
        b=dufICKfzBnJA7Otor9PX16sULQ2/Vq7ZNjonT4+lA0Xt5fbP8EuPyAIkoL48QWvfzD
         oUd2UqhWqiTKeNpupCQJlWYX2bXSGSCYfbkjbcVbFr7JKAb4C29RhnGO+gDqeyKtCWwI
         BeogBXWx8YcAYw7T8U1p+X9ZBTajftO7NLlmIVhY6YcwpNrYDSc8Fgs4waR0aaW6iV3S
         Xyna190P1mu0Qhfo6Ny63EsDeqm362O27pCJLFmF5i35YHaA4DtaLEIu5MwwU67vnL/1
         yRgOuHgQx9qBQBlMhjj8io3avGcfuILg4qZFWHVLjsPk85SlScgi1qnpK/cUIHnOgoxo
         ZjzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id q11si935658pgh.548.2019.03.19.23.45.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 23:45:29 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0616589BF8;
	Wed, 20 Mar 2019 06:45:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F223089BF8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 06:45:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 23:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,248,1549958400"; d="scan'208";a="135787221"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by fmsmga007.fm.intel.com with ESMTP; 19 Mar 2019 23:45:25 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 0/3] Enable both asynchronous and synchronous plane flip
Date: Wed, 20 Mar 2019 14:45:18 +0800
Message-Id: <20190320064521.31145-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
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

V3JpdGUgdG8gR0VOIGdyYXBoaWNzIGRpc3BsYXkgcmVnaXN0ZXIgUExBTkVfU1VSRiBpcyBjb25z
aWRlcmVkIGEgcGxhbmUgZmxpcCwKd2hpY2ggY2FuIGJlIGRvbmUgZWl0aGVyIHRocm91Z2ggY29t
bWFuZCBzdHJlYW1lciBvciBNTUlPIHdyaXRlIHN5bmNocm9ub3VzbHkKb3IgYXN5bmNocm9ub3Vz
bHkuIFN5bmNocm9ub3VzIHVwZGF0ZXMgd2lsbCB1cGRhdGUgdGhlIHBsYW5lIHN1cmZhY2UgdmFs
dWVzCmF0IHRoZSBzdGFydCBvZiB0aGUgbmV4dCB2ZXJ0aWNhbCBibGFuayB0byBwcmV2ZW50IHNj
cmVlbiB0ZWFyaW5nLCB3aGlsZQphc3luY2hyb25vdXMgdXBkYXRlcyB3aWxsIHVwZGF0ZSB0aGUg
cGxhbmUgc3VyZmFjZSBhcyBzb29uIGFzIHBvc3NpYmxlIGZvcgpmYXN0ZXIgc2NyZWVuIHVwZGF0
ZS4gVGhlIGJlaGF2aW91ciBkZXBlbmRzIG9uIE1JX0RJU1BMQVlfRkxJUCBjb21tYW5kIG9yCnBs
YW5lIGNvbnRyb2wgcmVnaXN0ZXIuCgpUaGVyZSBhbHNvIGV4aXN0IHNvbWUgbWlzdGFrZXMgb24g
ZW11bGF0aW5nIHBpcGUgZnJhbWUgY291bnQgYW5kIHBpcGUgZmxpcApjb3VudCBpbmNyZW1lbnQ6
Ci0gcGlwZSBmcmFtZSBjb3VudCBzaG91bGQgb25seSBnZXQgaW5jcmVtZW50ZWQgb24gZXZlcnkg
c3RhcnQgb2YgdnN5bmMsIG5vdAogIG9uIHBsYW5lIGZsaXAuCi0gcGlwZSBmbGlwIGNvdW50IGlu
ZGljYXRlcyB0aGUgc3RhcnQgb2YgZmxpcCB3aGVuIHRoZSBwbGFuZSBzdXJmYWNlCiAgYWRkcmVz
cyBpcyB1cGRhdGVkLCBub3Qgd2hlbiB0aGUgZmxpcCBjb21wbGV0ZXMuCi0gT24gR1ZUIGN1cnJl
bnRseSBzdXBwb3J0ZWQgcGxhdGZvcm1zIGluY2x1ZGluZyBCRFcgYW5kIFNLTCssIHBpcGUgZmxp
cAogIGNvdW50IG9ubHkgY291bnQgZmxpcHMgb2YgcHJpbWFyeSBwbGFuZS4KUmVsZXZhbnQgaW5m
b3JtYXRpb24gY2FuIGJlIGZvdW5kIG9uIEludGVsIEdGWCBQUk0gb24gMDEub3JnLgoKVGhlIHBh
dGNoIHNldCBlbmFibGVzIGFzeW5jaHJvbm91cyBwbGFuZSBmbGlwIGZvciBib3RoIE1JX0RJU1BM
QVlfRkxJUAp1cGRhdGUgYW5kIHBsYW5lIHN1cmZhY2UgYWRkcmVzcyBtbWlvIHVwZGF0ZS4gV2l0
aCB0aGUgcGF0Y2gsIHRoZSByZW5kZXIKcGVyZm9ybWFuY2Ugb2Ygc29tZSAzRCBhcHBsaWNhdGlv
biBlc3BlY2lhbGx5IGJlbmNobWFyayB0b29scyBjYW4gYmUKaW5jcmVhc2VkIHNpZ25pZmljYW50
bHkuIApBbiBleHBlcmltZW50IHRlc3RlZCBvbiBndnQtc3RhZ2luZyAoNS4wLjAtUkM0KToKSG9z
dDogSW50ZWwgQ0ZMIE5VQyAoaTctODU1OVUsIDE2R0IgbWVtb3J5KQpHdWVzdDogMiBWQ1BVLCA0
MDk2TUIgbWVtb3J5LCBUeXBlLTQgVkdQVSwgZG1hYnVmCkJlbmNobWFyazogM0RNYXJrIEljZVN0
b3JtIG9uIFdpbmRvd3MgMTAuMC4xNzEzNAoKKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tKwp8ICAgVGVzdCBJdGVtICAgIHwgIEJlZm9yZSAgIHwgICBBZnRlciAgICB8
CistLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKfCBHcmFwaGljcyBz
Y29yZSB8IDE0MzQ2ICAgICB8IDU1Mzg3ICAgICAgfAp8IEdyYXBoaWMgdGVzdCAxIHwgNjIuMzYg
RlBTIHwgMjUyLjY1IEZQUyB8CnwgR3JhcGhpYyB0ZXN0IDIgfCA2Mi4zOSBGUFMgfCAyMzAuMDQg
RlBTIHwKfCBQaHlzaWNhbCBzY29yZSB8IDE5Njg4ICAgICB8IDI2NjY1ICAgICAgfAp8IFBoeXNp
Y2FsIHRlc3QgIHwgNjIuNTAgRlBTIHwgODQuNjUgRlBTICB8CistLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKCkNvbGluIFh1ICgzKToKICBkcm0vaTkxNS9ndnQ6IEFk
ZCBtYWNybyBkZWZpbmUgZm9yIG1taW8gMHg1MDA4MCBhbmQgZ3Z0IGZsaXAgZXZlbnQKICBkcm0v
aTkxNS9ndnQ6IEVuYWJsZSBzeW5jaHJvbm91cyBmbGlwIG9uIGhhbmRsaW5nIE1JX0RJU1BMQVlf
RkxJUAogIGRybS9pOTE1L2d2dDogRW5hYmxlIGFzeW5jIGZsaXAgb24gcGxhbmUgc3VyZmFjZSBt
bWlvIHdyaXRlcwoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgfCAxMCAr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMgICAgfCAgMSAtCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyAgIHwgOTkgKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvcmVnLmggICAgICAgIHwgMjcgKysrKysr
KysKIDQgZmlsZXMgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
