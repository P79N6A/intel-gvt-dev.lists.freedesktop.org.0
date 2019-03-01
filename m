Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp125052ywe;
        Thu, 28 Feb 2019 18:56:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjzb1DfdR10Mq/b71eY0wpacxHOeOnbuvLI+bmhzDnU7g9ZQ48DezqtdTrHTCbsEOH/1zB
X-Received: by 2002:a65:5305:: with SMTP id m5mr2522291pgq.249.1551409010777;
        Thu, 28 Feb 2019 18:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551409010; cv=none;
        d=google.com; s=arc-20160816;
        b=kfVyvmLeG0JRNmOJLq7pNLREir3c0ERFMzgUFilzx1e+OyPgCOU0hdAZ4of8arvoXq
         i13i9tfzOEizYr9JZSV31IOdnELQ1k65vIgbnLARSi8hHmsua7cpvvkVWSk3xDjrwjti
         48yyI230UCQ7dxN+aoC2awca+XUObSkhblNA+p174txNRoUwgrOZQygIgGgH6sEB57pX
         nC2o6I+Vogaad8+Fkl1noitmimJzwd8l1OiIIaVd6MryWTV/3Xs6ZgRJPmI+WnbqcOF0
         oEAfFDHUBogFoPtPCVxJ/jIyo4ibCGNTwSS2vsSAdReVRY8SO37MLEXITSN0AQmMIpoO
         vXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=eg3zWuENJbUolZkeJlIhOtqNa6r/I/Qp5wunisf/51Q=;
        b=RJisGOEGNtfljlJ5Nn4rTDF67kH9UWux1N7vWOX2Yp4g7gTks4M0Bs++nAW8mwKyI/
         +HCXXLYfBV2gahDdpX/VORCCU/llmK1f52bLGG+tKKOSOtFp44T6z5a78Z9j82MAWijO
         w2fuwm47JNydLFQZLmUmZxYkJ4YyK9SqIWyW2tCHFg/8iZSwTAEz/Lz86zCl6rG/EVoK
         pUMmWC1Z3ap888tF+7Y5YeAVHHCJ+kYP/ukew8JNmSFhEqLZfspokw2P4dovyBId/SPy
         wkjyd0JUwUnhUamHxzxMFA4ZdXoR4oi/2Xvj0CL4cslI+TfOvlbyVHDJdGtHwUlXzKnH
         1dlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id g75si20397920pfg.49.2019.02.28.18.56.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 18:56:50 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3956E250;
	Fri,  1 Mar 2019 02:56:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C516E250
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Mar 2019 02:56:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 18:56:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,425,1544515200"; d="scan'208";a="118670923"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga007.jf.intel.com with ESMTP; 28 Feb 2019 18:56:48 -0800
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Feb 2019 18:56:48 -0800
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Feb 2019 18:56:47 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.163]) with mapi id 14.03.0415.000;
 Fri, 1 Mar 2019 10:56:45 +0800
From: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/i915/gvt: Only assign ppgtt root at dispatch time
Thread-Topic: [PATCH 2/3] drm/i915/gvt: Only assign ppgtt root at dispatch time
Thread-Index: AQHUz0vVYRflCQ3TcUaXV1sfp/+Cb6X2DaQw
Date: Fri, 1 Mar 2019 02:56:45 +0000
Message-ID: <8082FF9BCB2B054996454E47167FF4EC27543C82@SHSMSX104.ccr.corp.intel.com>
References: <20190228095542.23356-1-zhenyuw@linux.intel.com>
 <20190228095542.23356-2-zhenyuw@linux.intel.com>
In-Reply-To: <20190228095542.23356-2-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDY0ZDhlMDMtMmJjZC00YTc2LThiNzgtZTk3YjYzNzFhMDIyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOFZFSWdPeUc4TEdETGtsYmxhaG95eHpjVkRjQ25NY29jQkdzYmZiU2VXMlwvN282R3Vha0F5Mk9tcXZHUThVa0MifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
Cc: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBUaGlzIG1vdmVzIHBwZ3R0IHJvb3QgaG9vayBvdXQgb2Ygc2NhbiBhbmQgc2hhZG93IGZ1bmN0
aW9uLCBhcyBpdCdzIG9ubHkKPiByZXF1aXJlZCBhdCBkaXNwYXRjaCB0aW1lLiBBbHNvIG1ha2Ug
c3VyZSB0aGlzIGNoZWNrcyBhZ2FpbnN0IHNoYWRvdyBtbSB0bwo+IGJlIHJlYWR5LCBvdGhlcndp
c2UgYmFpbCBlYXJsaWVyLgpbWmhhbmcsIFhpb25nIFldIERvbid0IHNlZSB0aGUgYmVuZWZpdCBm
b3IgdGhpcy4KSSBpbmRlZWQgZm91bmQgYSBwb3RlbnRpYWwgaXNzdWUgaW4gb3VyIGNvZGU6IGlu
dGVsX3ZncHVfY3JlYXRlX3dvcmtsb2FkKCkgY2FsbCBpbnRlbF9ndnRfc2Nhbl9hbmRfc2hhZG93
X3dvcmtsb2FkKCkgd2hpY2ggb3BlcmF0ZSBzaGFkb3dfY3R4LCBidXQgc2hhZG93X2N0eCBtYXkg
YmUgdXNlZCBieSBvdGhlciBlbmdpbmUgYXQgdGhpcyB0aW1lLCB0aGlzIHdpbGwgY2F1c2Ugb3Ro
ZXIgZW5naW5lIHRyb3VibGUuIEkgc2VlIGJlZm9yZSBjYWxsaW5nIHNjYW5fYW5kX3NoYWRvdywg
aXQgY2FsbCBtdXRleF9sb2NrKGRybS5zdHJ1Y3RfbXV0ZXgpLCBJIGRvbid0IHRoaW5rIHRoaXMg
Y291bGQgcHJldmVudCB0aGUgaXNzdWUuCgp0aGFua3MKPiAKPiBDYzogWGlvbmcgWmhhbmcgPHhp
b25nLnkuemhhbmdAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFpoZW55dSBXYW5nIDx6aGVu
eXV3QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Nj
aGVkdWxlci5jIHwgMTYgKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hl
ZHVsZXIuYwo+IGluZGV4IDViNTljYmE5ZjkzYS4uZTI4YTNiMzUxM2E0IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwo+IEBAIC0zNDYsNyArMzQ2LDcgQEAgc3RhdGljIGlu
dCBzZXRfY29udGV4dF9wcGd0dF9mcm9tX3NoYWRvdyhzdHJ1Y3QKPiBpbnRlbF92Z3B1X3dvcmts
b2FkICp3b3JrbG9hZCwKPiAgCWludCBpID0gMDsKPiAKPiAgCWlmIChtbS0+dHlwZSAhPSBJTlRF
TF9HVlRfTU1fUFBHVFQKPiB8fCAhbW0tPnBwZ3R0X21tLnNoYWRvd2VkKQo+IC0JCXJldHVybiAt
MTsKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiAKPiAgCWlmIChtbS0+cHBndHRfbW0ucm9vdF9lbnRy
eV90eXBlID09Cj4gR1RUX1RZUEVfUFBHVFRfUk9PVF9MNF9FTlRSWSkgewo+ICAJCXB4X2RtYSgm
cHBndHQtPnBtbDQpID0gbW0tPnBwZ3R0X21tLnNoYWRvd19wZHBzWzBdOyBAQAo+IC00MTAsMTIg
KzQxMCw2IEBAIGludCBpbnRlbF9ndnRfc2Nhbl9hbmRfc2hhZG93X3dvcmtsb2FkKHN0cnVjdAo+
IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQo+ICAJaWYgKHdvcmtsb2FkLT5zaGFkb3cp
Cj4gIAkJcmV0dXJuIDA7Cj4gCj4gLQlyZXQgPSBzZXRfY29udGV4dF9wcGd0dF9mcm9tX3NoYWRv
dyh3b3JrbG9hZCwgc2hhZG93X2N0eCk7Cj4gLQlpZiAocmV0IDwgMCkgewo+IC0JCWd2dF92Z3B1
X2Vycigid29ya2xvYWQgc2hhZG93IHBwZ3R0IGlzbid0IHJlYWR5XG4iKTsKPiAtCQlyZXR1cm4g
cmV0Owo+IC0JfQo+IC0KPiAgCS8qIHBpbiBzaGFkb3cgY29udGV4dCBieSBndnQgZXZlbiB0aGUg
c2hhZG93IGNvbnRleHQgd2lsbCBiZSBwaW5uZWQKPiAgCSAqIHdoZW4gaTkxNSBhbGxvYyByZXF1
ZXN0LiBUaGF0IGlzIGJlY2F1c2UgZ3Z0IHdpbGwgdXBkYXRlIHRoZSBndWVzdAo+ICAJICogY29u
dGV4dCBmcm9tIHNoYWRvdyBjb250ZXh0IHdoZW4gd29ya2xvYWQgaXMgY29tcGxldGVkLCBhbmQg
YXQKPiB0aGF0IEBAIC02NzgsNiArNjcyLDggQEAgc3RhdGljIGludCBkaXNwYXRjaF93b3JrbG9h
ZChzdHJ1Y3QKPiBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9hZCkgIHsKPiAgCXN0cnVjdCBp
bnRlbF92Z3B1ICp2Z3B1ID0gd29ya2xvYWQtPnZncHU7Cj4gIAlzdHJ1Y3QgZHJtX2k5MTVfcHJp
dmF0ZSAqZGV2X3ByaXYgPSB2Z3B1LT5ndnQtPmRldl9wcml2Owo+ICsJc3RydWN0IGludGVsX3Zn
cHVfc3VibWlzc2lvbiAqcyA9ICZ2Z3B1LT5zdWJtaXNzaW9uOwo+ICsJc3RydWN0IGk5MTVfZ2Vt
X2NvbnRleHQgKnNoYWRvd19jdHggPSBzLT5zaGFkb3dfY3R4Owo+ICAJc3RydWN0IGk5MTVfcmVx
dWVzdCAqcnE7Cj4gIAlpbnQgcmluZ19pZCA9IHdvcmtsb2FkLT5yaW5nX2lkOwo+ICAJaW50IHJl
dDsKPiBAQCAtNjg4LDYgKzY4NCwxMiBAQCBzdGF0aWMgaW50IGRpc3BhdGNoX3dvcmtsb2FkKHN0
cnVjdAo+IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQo+ICAJbXV0ZXhfbG9jaygmdmdw
dS0+dmdwdV9sb2NrKTsKPiAgCW11dGV4X2xvY2soJmRldl9wcml2LT5kcm0uc3RydWN0X211dGV4
KTsKPiAKPiArCXJldCA9IHNldF9jb250ZXh0X3BwZ3R0X2Zyb21fc2hhZG93KHdvcmtsb2FkLCBz
aGFkb3dfY3R4KTsKPiArCWlmIChyZXQgPCAwKSB7Cj4gKwkJZ3Z0X3ZncHVfZXJyKCJ3b3JrbG9h
ZCBzaGFkb3cgcHBndHQgaXNuJ3QgcmVhZHlcbiIpOwo+ICsJCWdvdG8gZXJyX3JlcTsKPiArCX0K
PiArCj4gIAlyZXQgPSBpbnRlbF9ndnRfd29ya2xvYWRfcmVxX2FsbG9jKHdvcmtsb2FkKTsKPiAg
CWlmIChyZXQpCj4gIAkJZ290byBlcnJfcmVxOwo+IC0tCj4gMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
