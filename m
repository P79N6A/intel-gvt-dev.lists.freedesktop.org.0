Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp3117288ywb;
        Sun, 24 Mar 2019 18:52:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXgntReCMt+4Rji+8MaY2rQ/qcjYpvKLHBenKUQoEz0xM+8i81TZExLBr4fOLRxfjaSZnV
X-Received: by 2002:a63:5a4b:: with SMTP id k11mr20625011pgm.119.1553478748339;
        Sun, 24 Mar 2019 18:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553478748; cv=none;
        d=google.com; s=arc-20160816;
        b=CvpR2iTvGGUqgIWMdnNK1NdaPOe1RrrMSmDrK2pRt1hARTAIjiYfRvpY8d99rQWrXu
         T1u1cSZ0n4JIio4WKt/KMYqJ53sJl+L3+UJjvfD5N5XKS+ihwUjnU0rVLm+WdJNNQhv2
         yjwok3jxpLDtavFkPDoj+RlOXNaYiAfyzZWbyhFqvNs7iSqnWKtlQSa6UZN1QJ/o7wbh
         xuOPinobdCBBHdVJc6lXlopcmHFSpLheWuhOVGXG49WcmZLNA9bK0qeZZx7/ETkV+DYm
         58LuJi9sWu+rhNvMGG6zaVeffhxYK8/vw/Xl3abipS9H3qPqNheKy4LYqPjUi5xTNR2T
         Ug6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=aimBt04rIX4RGSJuC2b7TiREFrq25AgioJQBKN3xLZU=;
        b=SOJKjzi/+X1FTy6alzb0joqgKYhfdQ5Pfbn7WUwNO9TOmYn94U5ISDp0C5tLHld5mI
         voLd1CcNtIL7bQLQTBlEYqFMOXBHZrs4bNrndoQiXhyIhKFHWNoROhJvoTqc3YkXRqG+
         iMWQFK6KDv+DnwuPAk87T5RRLLdiVBQl9Xs0j50IW0dK7NfROt/zG1FhoH+jn2Q+/MqB
         zdfgFX8dkim6F8SUe8Kl1HefyyURpZHCRDU6k3vSsa5gChZ+LfF3sTZURcUab/ROenO8
         mPuZymwHQFIvAo29maY49gw+zbsNrdkSytmYtoYyDgT3j63w3hqLef0R9WGHkkA7J51a
         MNKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id y62si9552443pfy.259.2019.03.24.18.52.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Mar 2019 18:52:28 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09446E60A;
	Mon, 25 Mar 2019 01:52:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011EE6E60A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Mar 2019 01:52:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Mar 2019 18:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; d="scan'208";a="136943221"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2019 18:52:22 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 0/3] Enable both asynchronous and synchronous plane flip
Date: Mon, 25 Mar 2019 09:52:14 +0800
Message-Id: <20190325015217.24816-1-colin.xu@intel.com>
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
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKCnYyOgpBZGQgYml0IG9wZXJhdGlvbiBkZWZpbml0aW9u
IGZvciBmbGlwIG1vZGUuICh6aGVueXUpCgpDb2xpbiBYdSAoMyk6CiAgZHJtL2k5MTUvZ3Z0OiBB
ZGQgbWFjcm8gZGVmaW5lIGZvciBtbWlvIDB4NTAwODAgYW5kIGd2dCBmbGlwIGV2ZW50CiAgZHJt
L2k5MTUvZ3Z0OiBFbmFibGUgc3luY2hyb25vdXMgZmxpcCBvbiBoYW5kbGluZyBNSV9ESVNQTEFZ
X0ZMSVAKICBkcm0vaTkxNS9ndnQ6IEVuYWJsZSBhc3luYyBmbGlwIG9uIHBsYW5lIHN1cmZhY2Ug
bW1pbyB3cml0ZXMKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIHwgMTAg
KysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYyAgICB8ICAxIC0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jICAgfCA3MyArKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9yZWcuaCAgICAgICAgfCAzMSArKysr
KysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgOTQgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25z
KC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXY=
