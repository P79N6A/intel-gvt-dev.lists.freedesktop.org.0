Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3517025ywo;
        Tue, 23 Apr 2019 07:49:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwfRm2GG1wqlD8Yhz7mbD6jn5k3OblpJk496geVo1rHtJt9PeT2YXKbqPTh5K6Cj7KKnAqG
X-Received: by 2002:a17:902:362:: with SMTP id 89mr25600977pld.172.1556030950437;
        Tue, 23 Apr 2019 07:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556030950; cv=none;
        d=google.com; s=arc-20160816;
        b=0/iGHlOSlSoRVjs6NxxfRcrjS5iFE4m4TUUHLInXvFV9ab0THQv1+EQHqkSWaHiTmY
         l4o7s2x4SRaIZSUjnTZSg90G0E+ZUlKxwj6xdAtaBTcICiG9RF3wvhOxNaMZm/pCOEUS
         VTccFDRMt5ypatIrxr35dEY+B8FVsukJjS8X98GJkxsUw2uos4OvaQMqDWaUvVBvjJ7c
         uE1QsPhZkIsljUHZ6X/QnUXRzaERpLXVidcR7x0mktTrBtJETbfCI20b1e71jPFccC3u
         wKxadRHtetZ6pEX9twkvlzTUFwpwYf5KapGl8efknfTWVMOeqx5HJt7invxIstvT7XDo
         NZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=vPGKq9g1VrkyqW4APbQ4GiI5rCmVbPaa1uJ0PWnvPA0=;
        b=pWCAtEBsHqPQJY+4xz6MrRpjIrs2ObJFWwH2ZUbJwzBXLOR2tSwtORRY9zGxtMnSu2
         WJ8ymEoxLFng6mdVdIWFPFDBIwh6qzWb0Vrj6hYRGrra6Pr/qjz58eLkjybW+KagvtpQ
         0JxV91qZj8eK4idUnrFJjaxrDiC+aIBKaI5kVOK3aiB0sdgh53u5BJ/SyEExgSWdvutr
         SDaixl2fPKum7MdMgtM6Ld8u4YmS6t1aLN9UMN+E51vrWoIchxvrAsw3ofyoRhySi9B2
         dBxbYVcRhIqx3VmdwBp+cBP2wJAh7mDpASa0HIfEjGb69XpczBGiwowqb2NjqzmXK9aS
         nlDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v16si16093113plo.36.2019.04.23.07.49.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 07:49:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE2D89364;
	Tue, 23 Apr 2019 14:49:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59A289364
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 14:49:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EAFE210C6E;
 Tue, 23 Apr 2019 14:48:56 +0000 (UTC)
Received: from x1.home (ovpn-116-122.phx2.redhat.com [10.3.116.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 795CC5D6A9;
 Tue, 23 Apr 2019 14:48:52 +0000 (UTC)
Date: Tue, 23 Apr 2019 08:48:52 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] vfio/mdev: add version field as
 mandatory attribute for mdev device
Message-ID: <20190423084852.62168bb2@x1.home>
In-Reply-To: <20190423134400.GL6022@redhat.com>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083505.19654-1-yan.y.zhao@intel.com>
 <20190423103939.GF6022@redhat.com>
 <20190423063540.7ec83c31@x1.home>
 <20190423134400.GL6022@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 23 Apr 2019 14:49:08 +0000 (UTC)
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 arei.gonglei@huawei.com, felipe@nutanix.com, Ken.Xue@amd.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 changpeng.liu@intel.com, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 zhi.a.wang@intel.com, jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAyMyBBcHIgMjAxOSAxNDo0NDowMCArMDEwMApEYW5pZWwgUC4gQmVycmFuZ8OpIDxi
ZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMDY6
MzU6NDBBTSAtMDYwMCwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+ID4gT24gVHVlLCAyMyBBcHIg
MjAxOSAxMTozOTozOSArMDEwMAo+ID4gRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gPiAgIAo+ID4gPiBPbiBGcmksIEFwciAxOSwgMjAxOSBhdCAwNDoz
NTowNEFNIC0wNDAwLCBZYW4gWmhhbyB3cm90ZTogIAo+ID4gPiA+ICsqIHZlcnNpb24KPiA+ID4g
PiArCj4gPiA+ID4gKyAgVGhpcyBhdHRyaWJ1dGUgaXMgcncuIEl0IGlzIHVzZWQgdG8gY2hlY2sg
d2hldGhlciB0d28gZGV2aWNlcyBhcmUgY29tcGF0aWJsZQo+ID4gPiA+ICsgIGZvciBsaXZlIG1p
Z3JhdGlvbi4gSWYgdGhpcyBhdHRyaWJ1dGUgaXMgbWlzc2luZywgdGhlbiB0aGUgY29ycmVzcG9u
ZGluZyBtZGV2Cj4gPiA+ID4gKyAgZGV2aWNlIGlzIHJlZ2FyZGVkIGFzIG5vdCBzdXBwb3J0aW5n
IGxpdmUgbWlncmF0aW9uLgo+ID4gPiA+ICsKPiA+ID4gPiArICBJdCBjb25zaXN0cyBvZiB0d28g
cGFydHM6IGNvbW1vbiBwYXJ0IGFuZCB2ZW5kb3IgcHJvcHJpZXRhcnkgcGFydC4KPiA+ID4gPiAr
ICBjb21tb24gcGFydDogMzIgYml0LiBsb3dlciAxNiBiaXRzIGlzIHZlbmRvciBpZCBhbmQgaGln
aGVyIDE2IGJpdHMgaWRlbnRpZmllcwo+ID4gPiA+ICsgICAgICAgICAgICAgICBkZXZpY2UgdHlw
ZS4gZS5nLiwgZm9yIHBjaSBkZXZpY2UsIGl0IGlzCj4gPiA+ID4gKyAgICAgICAgICAgICAgICJw
Y2kgdmVuZG9yIGlkIiB8IChWRklPX0RFVklDRV9GTEFHU19QQ0kgPDwgMTYpLgo+ID4gPiA+ICsg
IHZlbmRvciBwcm9wcmlldGFyeSBwYXJ0OiB0aGlzIHBhcnQgaXMgdmFyaWVkIGluIGxlbmd0aC4g
dmVuZG9yIGRyaXZlciBjYW4KPiA+ID4gPiArICAgICAgICAgICAgICAgc3BlY2lmeSBhbnkgc3Ry
aW5nIHRvIGlkZW50aWZ5IGEgZGV2aWNlLgo+ID4gPiA+ICsKPiA+ID4gPiArICBXaGVuIHJlYWRp
bmcgdGhpcyBhdHRyaWJ1dGUsIGl0IHNob3VsZCBzaG93IGRldmljZSB2ZXJzaW9uIHN0cmluZyBv
ZiB0aGUgZGV2aWNlCj4gPiA+ID4gKyAgb2YgdHlwZSA8dHlwZS1pZD4uIElmIGEgZGV2aWNlIGRv
ZXMgbm90IHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24sIGl0IHNob3VsZAo+ID4gPiA+ICsgIHJldHVy
biBlcnJuby4KPiA+ID4gPiArICBXaGVuIHdyaXRpbmcgYSBzdHJpbmcgdG8gdGhpcyBhdHRyaWJ1
dGUsIGl0IHJldHVybnMgZXJybm8gZm9yIGluY29tcGF0aWJpbGl0eQo+ID4gPiA+ICsgIG9yIHJl
dHVybnMgd3JpdHRlbiBzdHJpbmcgbGVuZ3RoIGluIGNvbXBhdGliaWxpdHkgY2FzZS4gSWYgYSBk
ZXZpY2UgZG9lcyBub3QKPiA+ID4gPiArICBzdXBwb3J0IGxpdmUgbWlncmF0aW9uLCBpdCBhbHdh
eXMgcmV0dXJucyBlcnJuby4KPiA+ID4gPiArCj4gPiA+ID4gKyAgZm9yIGV4YW1wbGUuCj4gPiA+
ID4gKyAgIyBjYXQgXAo+ID4gPiA+ICsgL3N5cy9idXMvcGNpL2RldmljZXMvMDAwMFw6MDBcOjAy
LjAvbWRldl9zdXBwb3J0ZWRfdHlwZXMvaTkxNS1HVlRnX1Y1XzIvdmVyc2lvbgo+ID4gPiA+ICsg
IDAwMDI4MDg2LTE5M2ItaTkxNS1HVlRnX1Y1XzIKPiA+ID4gPiArCj4gPiA+ID4gKyAgI2VjaG8g
MDAwMjgwODYtMTkzYi1pOTE1LUdWVGdfVjVfMiA+IFwKPiA+ID4gPiArIC9zeXMvYnVzL3BjaS9k
ZXZpY2VzLzAwMDBcOjAwXDowMi4wL21kZXZfc3VwcG9ydGVkX3R5cGVzL2k5MTUtR1ZUZ19WNV80
L3ZlcnNpb24KPiA+ID4gPiArIC1iYXNoOiBlY2hvOiB3cml0ZSBlcnJvcjogSW52YWxpZCBhcmd1
bWVudAo+ID4gPiA+ICsgICAgCj4gPiA+IAo+ID4gPiBJSVVDIHRoaXMgcGF0aCBpcyBhZ2FpbnN0
IHRoZSBwaHlzaWNhbCBkZXZpY2UuIElPVywgdGhlIG1nbXQgYXBwIHdvdWxkIGhhdmUKPiA+ID4g
dG8gZmlyc3Qgd3JpdGUgdG8gdGhlICJ2ZXJzaW9uIiBmaWxlIHRvIGNob29zZSBhIHZlcnNpb24s
IGFuZCB0aGVuIHdyaXRlIHRvCj4gPiA+IHRoZSAiY3JlYXRlIiBmaWxlIHRvIGFjdHVhbGx5IGNy
ZWF0ZSBhbiB2aXJ0dWFsIGRldmljZS4gVGhpcyBoYXMgdGhlIG9idmlvdXMKPiA+ID4gY29uY3Vy
cmVuY3kgcHJvYmxlbSBpZiBtdWx0aXBsZSBkZXZpY2VzIGFyZSBiZWluZyBjcmVhdGVkIGF0IHRo
ZSBzYW1lIHRpbWUKPiA+ID4gYW5kIGRpc3RpbmN0IHZlcnNpb25zIGZvciBlYWNoIGRldmljZSBh
cmUgcmVxdWlyZWQuIFRoZXJlIHdvdWxkIG5lZWQgdG8gYmUKPiA+ID4gYSBsb2NraW5nIHNjaGVt
ZSBkZWZpbmVkIHRvIGVuc3VyZSBzYWZldHkuICAKPiA+IAo+ID4gIkNyZWF0ZSBhIGRldmljZSBv
ZiBhIGdpdmVuIHZlcnNpb24iIGlzIG5vdCBhbiBpbnRlbmRlZCBmZWF0dXJlIG9mIHRoaXMKPiA+
IGludGVyZmFjZSBhaXVpLiAgV3JpdGluZyB0aGUgdmVyc2lvbiBhdHRyaWJ1dGUgb25seSBpbmRp
Y2F0ZXMKPiA+IG1pZ3JhdGlvbiBjb21wYXRpYmlsaXR5IHdpdGggYSBiaW5hcnkgcmVzdWx0Lgo+
ID4gICAgCj4gPiA+IFdvdWxkbid0IGl0IGJlIGJldHRlciBpZiB3ZSBjYW4gcGFzcyB0aGUgZGVz
aXJlZCB2ZXJzaW9uIHdoZW4gd2Ugd3JpdGUgdG8KPiA+ID4gdGhlICJjcmVhdGUiIGZpbGUsIHNv
IHRoYXQgd2UgYXZvaWQgYW55IGNvbmN1cnJlbnQgdXNhZ2UgcHJvYmxlbXMuICJ2ZXJzaW9uIgo+
ID4gPiBjb3VsZCBiZSBqdXN0IGEgcmVhZC1vbmx5IGZpbGUgd2l0aCBhICpsaXN0KiBvZiBzdXBw
b3J0ZWQgdmVyc2lvbnMuCj4gPiA+IAo+ID4gPiBlZwo+ID4gPiAKPiA+ID4gICAkIGNhdCAvc3lz
L2J1cy9wY2kvZGV2aWNlcy8wMDAwXDowMFw6MDIuMC9tZGV2X3N1cHBvcnRlZF90eXBlcy9pOTE1
LUdWVGdfVjVfNC92ZXJzaW9uCj4gPiA+ICAgNS4wCj4gPiA+ICAgNS4xCj4gPiA+ICAgNS4yCj4g
PiA+IAo+ID4gPiAgICQgZWNobyAiODNiOGY0ZjItNTA5Zi0zODJmLTNjMWUtZTZiZmUwZmExMDAx
O3ZlcnNpb249NS4yIiA+Cj4gPiA+ICAgICAgIC9zeXMvZGV2aWNlcy92aXJ0dWFsL210dHkvbXR0
eS9tZGV2X3N1cHBvcnRlZF90eXBlcy9tdHR5LTIvY3JlYXRlICAKPiA+IAo+ID4gVGhpcyBpcyBy
ZW1pbmlzY2VudCBvZiB0aGUgcHJvcG9zZWQgYWdncmVnYXRpb24gc3VwcG9ydCwgYnV0IGFnYWlu
LAo+ID4gdGhpcyBzb3J0IG9mIGZlYXR1cmUgaXMgbm90IGludGVuZGVkIGhlcmUuICBJdCdzIG5v
IGV4cGVjdGVkIHRoYXQgYW55Cj4gPiB2ZW5kb3IgZHJpdmVyIHdvdWxkIHN1cHBvcnQgY3JlYXRp
bmcgZGV2aWNlIHR5cGVzIG9mIGRpZmZlcmVudAo+ID4gdmVyc2lvbnMsIGJ1dCB0aGV5IG1heSBz
dXBwb3J0IG1pZ3JhdGlvbiBmcm9tIGRpZmZlcmVudCB2ZXJzaW9ucy4gIAo+IAo+IEhtbSwgdGhh
dCdzIGEgc3VidGxlIGRpc3RpbmN0aW9uIEkgd2Fzbid0IHNlZWluZyB0aGUgcGF0Y2ggc2VyaWVz
Lgo+IElJVUMgZnJvbSB3aGF0IHlvdSdyZSBzYXlpbmcsIGEgZGV2aWNlIGNhbiBiZSBjcmVhdGVk
IHdpdGggdmVyc2lvbgo+ICJDIiwgYnV0IGZvciBhbiBpbmNvbWluZyBtaWdyYXRpb24gaXQgY2Fu
IChwb3RlbnRpYWxseSkgYWNjZXB0Cj4gc2VyaWFsaXplZCBzdGF0ZSBtYXRjaGluZyBhbnkgb2Yg
dmVyc2lvbnMgIkEiLCAiQiIgb3IgIkMiLgo+IAo+IFRoYXQgaXMgc3VmZmljaWVudCBpZiBtaWdy
YXRpb24gaXMgYmVpbmcgdXNlZCBhcyBhIGhvc3QgdXBncmFkZQo+IHRvb2wsIHRvIG1vdmUgZnJv
bSBPUyByZWxlYXNlIE4gdG8gTiArIDEuCj4gCj4gSXQgd291bGRuJ3QgY292ZXIgdGhlIGNhc2Ug
d2hlcmUgeW91IG5lZWQgdG8gc3VwcG9ydCBiYWNrd2FyZHMKPiBtaWdyYXRpb24gdG9vLiBlZyBp
ZiB5b3UgaGF2ZSBhIG1peHR1cmUgb2YgaG9zdHMgd2l0aCByZWxlYXNlCj4gTiBhbmQgTiArIDEg
YW5kIHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQgVk1zIGNhbiBhbHdheXMgbW92ZQo+IGJldHdlZWVu
IGFueSBob3N0LiAgVGhhdCB3b3VsZCByZXF1aXJlIHRoYXQgeW91IGNhbiBjcmVhdGUKPiBtZGV2
cyB3aXRoIHRoZSBsb3dlc3QgY29tbW9uIGRlbm9taW5hdG9yIHZlcnNpb24sIG5vdCBzb2xlbHkK
PiB0aGUgbW9zdCByZWNlbnQuCj4gCj4gSW4gUUVNVSB0aGlzIGlzIGRvbmUgYnkgbWdtdCBhcHBs
aWNhdGlvbnMgcGlja2luZyBhIHZlcnNpb25lZAo+IG1hY2hpbmUgdHlwZSBmb3IgUUVNVSB0aGF0
IGlzIG9sZGVyIHRoYW4gbW9zdCByZWNlbnQuCgpJIHN1cHBvc2Ugd2UnZCBuZWVkIHRvIGRldGVy
bWluZSBob3cgaW1wb3J0YW50IHRoYXQgaXMsIHRoaXMgaXMganVzdCBhCmRldmljZSBhZnRlciBh
bGwsIHRoZXJlIGFyZSBhbHdheXMgZmFsbGJhY2sgbWVjaGFuaXNtcyB2aWEgaG90cGx1Zy4KVGhl
cmUgYXJlIGEgbG90IG9mIHBpZWNlcyB0aGF0IG5lZWQgdG8gbGluZSB1cCBmb3IgYmFja3dhcmRz
IG1pZ3JhdGlvbgppbmNsdWRpbmcgc3VwcG9ydCBmb3IgaXQgYXQgdGhlIGluZGl2aWR1YWwgdmVu
ZG9yIGRyaXZlci4gIE5vdGhpbmcgd2UKZGVzaWduIGludG8gdGhlIEFQSSBpcyBnb2luZyB0byBy
ZXF1aXJlIHZlbmRvciBkcml2ZXJzIHRvIHN1cHBvcnQKYmFja3dhcmRzIG1pZ3JhdGlvbiBhbmQg
d2UgYWxyZWFkeSBoYXZlIHNvbWUgdmVuZG9ycyByZXF1aXJpbmcgaG9zdCBhbmQKZ3Vlc3QgZHJp
dmVyIGFsaWdubWVudC4gIFNwZWNpZnlpbmcgYSB2ZXJzaW9uIHdpdGggYSBjcmVhdGUgc3ludGF4
IGFzCnlvdSd2ZSBwcm92aWRlZCBpcyByZWFzb25hYmxlLCBidXQgdGhpcyBhbHNvIGJhbGxvb25z
IGludG8gd2hvbGUKdGFuZ2VudGlhbCBpbnRlcmZhY2UgcHJvdmlkaW5nIGluZm9ybWF0aW9uIHJl
Z2FyZGluZyB3aGF0IHZlcnNpb25zIGEKdmVuZG9yIGRyaXZlciBpcyBhYmxlIHRvIGNyZWF0ZSwg
YmVjYXVzZSBwcmVzdW1hYmx5IG1hbmFnZW1lbnQgdG9vbHMKd291bGRuJ3QgcHJlZmVyIGEgdHJ5
LWFuZC1zZWUgdHlwZSBpbnRlcmZhY2UuICBJIGJlbGlldmUgYW4gaW50ZW50aW9uYWwKYXNwZWN0
IG9mIHRoZSBwcm9wb3NhbCBoZXJlIGlzIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBwcm92aWRlIGEg
bGlzdCBvZgpjb21wYXRpYmxlIHZlcnNpb25zLCB0aGF0J3MgaGFuZGxlZCBpbnRlcm5hbGx5IHRv
IHRoZSB2ZW5kb3IgZHJpdmVyLgoKSSBkb24ndCBrbm93IGlmIHdlIGNvdWxkIHN0YXJ0IHdpdGgg
dGhlIHByb3Bvc2FsIGhlcmUgYW5kIGxhdGVyIGFkZAp0aGVzZSBzb3J0cyBvZiBmZWF0dXJlcy4g
IElkZWFzPyAgVGhhbmtzLAoKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
