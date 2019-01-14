Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2848167ywd;
        Mon, 14 Jan 2019 02:03:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4SDbBdaYqZgyPvS6haawOTH9x1YKrh4zu59jTpZ9pMt3/TgY+jCXxxwMftxxkZRJi+PA2U
X-Received: by 2002:a63:65c7:: with SMTP id z190mr19960768pgb.249.1547460232297;
        Mon, 14 Jan 2019 02:03:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547460232; cv=none;
        d=google.com; s=arc-20160816;
        b=PJSgzsucJFul5KUkqSLf8xKSRPsSGD7RzX3fuHezbFQpn5lC0C3dr0sQU4bKEIgnzx
         NlFcqDP1HSv5UL3rJlX1F0Mx1vNK4vv4TVpvxO/yfN0i3WZ88yskGZcS+WkQBKWlVMJI
         Nd67I1G0sAyVFhvBcw2V6HdlV+w2I/wId/Z07brZ3//yeAxlplxwoEXq+iwdkItMJlWg
         y8oNNh1xu3kGtJJNQN6GyN1Ce2VWUVm3IGWWlBjHN2XEl0GE5JkhSanqGIn1fpMwBcxb
         KvUibtY433DA9FbU9NMA7F5b3oaNA5zSQNhR3ZEmfIoUIQpKK2rQPEKL/RHwbNJkKSim
         rv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:content-language:in-reply-to:mime-version:user-agent
         :date:message-id:from:references:to:subject:delivered-to;
        bh=mY/xA0nX8HWf2c2+8KxG6a/oG7ba6d1wH18uouVa8ao=;
        b=Idcy54+5r4tbSXqtm1r7zvfdq8hhsFJGqWT2asw+BtC3+tLEKcA4+gHAc0as+azaP5
         o+qktQ23bEZLgiT0JdxzeB1yMHMv1J4cegjnID5qjKSqDTZSQryjRzKtMWh2IplAVQ2+
         +kzo1h3a3RCcVi1FGepuCbkWXgwngFeAN65WklCriEz8Pq2zFrKM00vfBXQV4LsPUGJl
         SH9cBhvc1uZLWih4SS3SaqmLOQXWBI9nty+PRmYGc81BxamFKMRNnytOHtgNYBDO4ZoF
         /ZuyrHwb8dx7r7ulmFo4QJe15vXy7I776Fv9PN4q6K0zk4fA5dyxqdEUVwrqvMArDxi7
         qWDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id m188si49946778pfb.266.2019.01.14.02.03.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jan 2019 02:03:52 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C836E75A;
	Mon, 14 Jan 2019 10:03:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3F06E75A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 10:03:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2019 02:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,477,1539673200"; d="scan'208";a="106424144"
Received: from henry-optiplex-7050.bj.intel.com (HELO [10.238.157.81])
 ([10.238.157.81])
 by orsmga007.jf.intel.com with ESMTP; 14 Jan 2019 02:03:48 -0800
Subject: Re: [PATCH v1 1/4] drm/i915/gvt: add one hypercall to clean vfio
 regions
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
 <1547118288-1001-2-git-send-email-hang.yuan@linux.intel.com>
 <20190114035645.GX11631@zhen-hp.sh.intel.com>
 <44564146-3284-14d9-8679-891d874fa7b5@linux.intel.com>
 <20190114050557.GZ11631@zhen-hp.sh.intel.com>
 <f9de100c-be8e-617d-3a69-ae47feb4488a@linux.intel.com>
 <20190114060914.GB11631@zhen-hp.sh.intel.com>
From: Hang Yuan <hang.yuan@linux.intel.com>
Message-ID: <21f24006-a7a0-a0a5-e182-1a115979874c@linux.intel.com>
Date: Mon, 14 Jan 2019 17:56:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190114060914.GB11631@zhen-hp.sh.intel.com>
Content-Language: en-US
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
Cc: intel-gvt-dev@lists.freedesktop.org, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMS8xNC8xOSAyOjA5IFBNLCBaaGVueXUgV2FuZyB3cm90ZToKPiBPbiAyMDE5LjAxLjE0IDEz
OjM0OjMzICswODAwLCBIYW5nIFl1YW4gd3JvdGU6Cj4+IE9uIDEvMTQvMTkgMTowNSBQTSwgWmhl
bnl1IFdhbmcgd3JvdGU6Cj4+PiBPbiAyMDE5LjAxLjE0IDEzOjAyOjI0ICswODAwLCBIYW5nIFl1
YW4gd3JvdGU6Cj4+Pj4gT24gMS8xNC8xOSAxMTo1NiBBTSwgWmhlbnl1IFdhbmcgd3JvdGU6Cj4+
Pj4+IE9uIDIwMTkuMDEuMTAgMTk6MDQ6NDUgKzA4MDAsIGhhbmcueXVhbkBsaW51eC5pbnRlbC5j
b20gd3JvdGU6Cj4+Pj4+PiBGcm9tOiBIYW5nIFl1YW4gPGhhbmcueXVhbkBsaW51eC5pbnRlbC5j
b20+Cj4+Pj4+Pgo+Pj4+Pj4gQWRkIG9uZSBoeXBlcmNhbGwgdG8gZnJlZSBWRklPIHJlZ2lvbiBt
ZW1vcnkuIEFsc28gY2FsbCBpdCBpbiB2Z3B1Cj4+Pj4+PiBkZXN0cm95Lgo+Pj4+Pj4KPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGxpbnV4LmludGVsLmNvbT4KPj4+
Pj4+IC0tLQo+Pj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwuaCB8
ICAxICsKPj4+Pj4+ICAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgfCAx
NSArKysrKysrKysrKysrKysKPj4+Pj4+ICAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0
LmggICAgICAgfCAxNCArKysrKysrKysrKysrKwo+Pj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC92Z3B1LmMgICAgICB8ICAxICsKPj4+Pj4+ICAgICA0IGZpbGVzIGNoYW5nZWQsIDMx
IGluc2VydGlvbnMoKykKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2h5cGVyY2FsbC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2Fs
bC5oCj4+Pj4+PiBpbmRleCA1MDc5ODg2Li4yYWI0MTM4IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2FsbC5oCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmgKPj4+Pj4+IEBAIC02Nyw2ICs2Nyw3IEBAIHN0cnVj
dCBpbnRlbF9ndnRfbXB0IHsKPj4+Pj4+ICAgICAJaW50ICgqc2V0X3RyYXBfYXJlYSkodW5zaWdu
ZWQgbG9uZyBoYW5kbGUsIHU2NCBzdGFydCwgdTY0IGVuZCwKPj4+Pj4+ICAgICAJCQkgICAgIGJv
b2wgbWFwKTsKPj4+Pj4+ICAgICAJaW50ICgqc2V0X29wcmVnaW9uKSh2b2lkICp2Z3B1KTsKPj4+
Pj4+ICsJdm9pZCAoKmNsZWFuX3JlZ2lvbnMpKHZvaWQgKnZncHUpOwo+Pj4+Pj4gICAgIAlpbnQg
KCpnZXRfdmZpb19kZXZpY2UpKHZvaWQgKnZncHUpOwo+Pj4+Pj4gICAgIAl2b2lkICgqcHV0X3Zm
aW9fZGV2aWNlKSh2b2lkICp2Z3B1KTsKPj4+Pj4+ICAgICAJYm9vbCAoKmlzX3ZhbGlkX2dmbiko
dW5zaWduZWQgbG9uZyBoYW5kbGUsIHVuc2lnbmVkIGxvbmcgZ2ZuKTsKPj4+Pj4KPj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4+Pj4+PiBpbmRleCBhMTllNjg0Li44YzMwZGMzIDEwMDY0
NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPj4+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4+Pj4+PiBAQCAtNDkzLDYgKzQ5
MywyMCBAQCBzdGF0aWMgaW50IGt2bWd0X3NldF9vcHJlZ2lvbih2b2lkICpwX3ZncHUpCj4+Pj4+
PiAgICAgCXJldHVybiByZXQ7Cj4+Pj4+PiAgICAgfQo+Pj4+Pj4gK3N0YXRpYyB2b2lkIGt2bWd0
X2NsZWFuX3JlZ2lvbnModm9pZCAqcF92Z3B1KQo+Pj4+Pj4gK3sKPj4+Pj4+ICsJaW50IGk7Cj4+
Pj4+PiArCXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1ID0gKHN0cnVjdCBpbnRlbF92Z3B1ICopcF92
Z3B1Owo+Pj4+Pj4gKwo+Pj4+Pj4gKwlmb3IgKGkgPSAwOyBpIDwgdmdwdS0+dmRldi5udW1fcmVn
aW9uczsgaSsrKQo+Pj4+Pj4gKwkJaWYgKHZncHUtPnZkZXYucmVnaW9uW2ldLm9wcy0+cmVsZWFz
ZSkKPj4+Pj4+ICsJCQl2Z3B1LT52ZGV2LnJlZ2lvbltpXS5vcHMtPnJlbGVhc2UodmdwdSwKPj4+
Pj4+ICsJCQkJCSZ2Z3B1LT52ZGV2LnJlZ2lvbltpXSk7Cj4+Pj4+PiArCXZncHUtPnZkZXYubnVt
X3JlZ2lvbnMgPSAwOwo+Pj4+Pj4gKwlrZnJlZSh2Z3B1LT52ZGV2LnJlZ2lvbik7Cj4+Pj4+PiAr
CXZncHUtPnZkZXYucmVnaW9uID0gTlVMTDsKPj4+Pj4+ICt9Cj4+Pj4+Cj4+Pj4+IEl0IGxvb2tz
IGEgbGl0dGxlIG92ZXJraWxsIHRvIHB1dCB0aGlzIHJlcXVpcmVtbnQgb24gYWxsIGh5cGVydmlz
b3IsCj4+Pj4+IGFzIFZGSU8gcmVnaW9uIGlzIEtWTUdUIG9ubHkgdGhpbmcsIGUuZyBtaWdodCBu
b3QgYmUgdmFsaWQgZm9yIG90aGVyIGh5cGVydmlzb3IuCj4+Pj4+IEFuZCBsb29rcyBvdXIgcmVn
aW9uLm9wcy5yZWxlYXNlIGlzIG5ldmVyIGFjdHVhbGx5IHVzZWZ1bCwgd2hhdCB3ZSBuZWVkCj4+
Pj4+IGlzIHRvIGZyZWUgdXAgdmdwdSByZWdpb25zLCBtYXliZSBqdXN0IGF0IGRldGFjaCB2Z3B1
IHRpbWUgdG8gbGV0IGh5cGVydmlzb3IKPj4+Pj4gZG8gYW55IGNsZWFudXAgcmVxdWlyZWQuCj4+
Pj4+Cj4+Pj4gSGVucnk6U2luY2UgdGhlcmUgaXMgYWxyZWFkeSBoeXBlcmNhbGwgJ3NldF9vcHJl
Z2lvbicsIEkgdXNlIGh5cGVyY2FsbCBhcwo+Pj4+IHdlbGwgdG8gZG8gcmVnaW9uIGNsZWFuIGZv
ciBvcHJlZ2lvbiBhbmQgZWRpZCByZWdpb24gdG8gaGF2ZSBjb25zaXN0ZW50Cj4+Pj4gaW50ZXJm
YWNlIGJldHdlZW4gZ3Z0IGFuZCBoeXBlcnZpc29yLiAnY2xlYW5fcmVnaW9ucycgd2lsbCBhbHNv
IGJlIGNhbGxlZCBpZgo+Pj4+IGZhaWx1cmUgaW4gdmdwdSBjcmVhdGUuIFNvIEkgZGlkbid0IGlt
cGxlbWVudCBpdCBpbiB2Z3B1IGRldGFjaC4KPj4+Pgo+Pj4KPj4+ICJzZXRfb3ByZWdpb24iIGh5
cGVyY2FsbCBtZWFucyBoeXBlcnZpc29yIG1pZ2h0IGhhdmUgZGlmZmVyZW50IHdheXMgdG8KPj4+
IGV4cG9zZSBvcHJlZ2lvbiwgZS5nIHRocm91Z2ggdmZpbyByZWdpb24sIGV0Yy4gU28gdGhhdCBt
YWtlcyBzZW5zZSBmb3IgYQo+Pj4gbXB0IGludGVyZmFjZS4gQnV0IGhlcmUgb25seSBjYXJlIGFi
b3V0IGNsZWFudXAgb2YgVkZJTyByZWdpb24sIGFuZCBib3RoCj4+PiBvcHJlZ2lvbiBhbmQgZWRp
ZCByZWdpb24ncyByZWxlYXNlIGZ1bmN0aW9uIGlzIG5vb3AuLgo+Pj4KPj4gSGVucnk6IFNvIGRv
IHlvdSBtZWFuIHRvIGV4cG9zZSB0aGUgZnVuY3Rpb25zIChjbGVhbl9yZWdpb25zL3NldF9lZGlk
KSBpbgo+PiBrdm1ndCBpbnN0ZWFkIG9mIGh5cGVyY2FsbCBpZiB0aGUgZnVuY3Rpb24gaXMgb25s
eSB2YWxpZCBmb3IgS1ZNPwo+Pgo+IAo+IEZvciBjbGVhbiByZWdpb24gaGVyZSwgZm9yIG1lIGl0
IGxvb2tzIHdlIGp1c3QgbmVlZCB0byBmaXggaXQgYnkgY2xlYW4KPiB2Z3B1IHJlZ2lvbnMgaW4g
ZGV0YWNoIGNhbGwsIGFuZCBmb3Igc2V0X2VkaWQgb25lIG1wdCBpbnRlcmZhY2UgaXMgb2sKPiBh
bmQgcmVnaW9uIGNsZWFudXAgaW4gZGV0YWNoIHdvdWxkIGFsc28gd29yayBpbiBlcnJvciBoYW5k
bGluZyBwYXRoLgo+IApHb3QgaXQuIFRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzIQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
