Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3451488ywo;
        Tue, 23 Apr 2019 06:44:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9V8RevOdi/LWHch5mfGb3OizDbT5F8RxQx6A48d3tvRkePzla4362Tppa89odq+h3Cfq+
X-Received: by 2002:a17:902:8f92:: with SMTP id z18mr25562249plo.123.1556027060742;
        Tue, 23 Apr 2019 06:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556027060; cv=none;
        d=google.com; s=arc-20160816;
        b=sGza3xeoUOsiqq6TgeCF1jpivZz1L44gSfABQxAbTipEIe6arCeiGQ1JJDuJT31M5m
         ytMTmTmd0DMa99dGoIGaP/SeUu20Q9oPSnNj03lNyeqjwRrZcaXSq9hk4xVwUV84HMOo
         6sHED09E7Acmu6LojZKHXDYe6hztYorDVAroyhPNmKTeInTYwTiTNkSBdtf5Kwcy6nCc
         20+w2j/HTBjhwtfDZceDH2Rp/ifAPaisURJ4AkhtZVl24bMXfgUHjvwrXaFgFabeSWBm
         bhlsueaXKBc8Q32mdQRKYluAVl9sj5bqVjyaSwll+OvqlZTU79DAD9GDOIONQ2vaPIZp
         mNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=HumoY0wjuSLLtdysBPY/f2oVH05ACaxALKKYjAzSZ/0=;
        b=d93uaYqJPIJtc1K2MjCbxMi9nSF9CYr/GNxRqvIxKLtMs43suTdvryfNTdlrcKVNBS
         fhE5HFBoueB4wA71+lIYYOGgAhdIav8xQza74YczwxAlSybnH5m8VN7O1Jx4Pilcoa00
         tUcJLvIxm1xuePKbUBDZLYDPudC8LsItbNVJRo9lKr2OBE4w9RKBqbwVF/ZihZGzKkg7
         I2i8UXglULxHQ5cSx18nkTh3DK77qfFQayR05SBn8epTA1o98sYM5AtXXRHVScsbBoNP
         /tEqopVyd88zRe61Ml+z/34NvcDc+m3Tb8RAPwNGCzGT2yco8h5NmhKbxOZAozS/N1ws
         t57Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id s1si5950976pgh.125.2019.04.23.06.44.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 06:44:20 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0595389208;
	Tue, 23 Apr 2019 13:44:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE0489208
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 13:44:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 63B323086212;
 Tue, 23 Apr 2019 13:44:18 +0000 (UTC)
Received: from redhat.com (ovpn-112-50.ams2.redhat.com [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B6D45C220;
 Tue, 23 Apr 2019 13:44:02 +0000 (UTC)
Date: Tue, 23 Apr 2019 14:44:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] vfio/mdev: add version field as
 mandatory attribute for mdev device
Message-ID: <20190423134400.GL6022@redhat.com>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083505.19654-1-yan.y.zhao@intel.com>
 <20190423103939.GF6022@redhat.com>
 <20190423063540.7ec83c31@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190423063540.7ec83c31@x1.home>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 23 Apr 2019 13:44:19 +0000 (UTC)
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
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

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMDY6MzU6NDBBTSAtMDYwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFR1ZSwgMjMgQXByIDIwMTkgMTE6Mzk6MzkgKzAxMDAKPiBEYW5pZWwgUC4g
QmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToKPiAKPiA+IE9uIEZyaSwgQXBy
IDE5LCAyMDE5IGF0IDA0OjM1OjA0QU0gLTA0MDAsIFlhbiBaaGFvIHdyb3RlOgo+ID4gPiArKiB2
ZXJzaW9uCj4gPiA+ICsKPiA+ID4gKyAgVGhpcyBhdHRyaWJ1dGUgaXMgcncuIEl0IGlzIHVzZWQg
dG8gY2hlY2sgd2hldGhlciB0d28gZGV2aWNlcyBhcmUgY29tcGF0aWJsZQo+ID4gPiArICBmb3Ig
bGl2ZSBtaWdyYXRpb24uIElmIHRoaXMgYXR0cmlidXRlIGlzIG1pc3NpbmcsIHRoZW4gdGhlIGNv
cnJlc3BvbmRpbmcgbWRldgo+ID4gPiArICBkZXZpY2UgaXMgcmVnYXJkZWQgYXMgbm90IHN1cHBv
cnRpbmcgbGl2ZSBtaWdyYXRpb24uCj4gPiA+ICsKPiA+ID4gKyAgSXQgY29uc2lzdHMgb2YgdHdv
IHBhcnRzOiBjb21tb24gcGFydCBhbmQgdmVuZG9yIHByb3ByaWV0YXJ5IHBhcnQuCj4gPiA+ICsg
IGNvbW1vbiBwYXJ0OiAzMiBiaXQuIGxvd2VyIDE2IGJpdHMgaXMgdmVuZG9yIGlkIGFuZCBoaWdo
ZXIgMTYgYml0cyBpZGVudGlmaWVzCj4gPiA+ICsgICAgICAgICAgICAgICBkZXZpY2UgdHlwZS4g
ZS5nLiwgZm9yIHBjaSBkZXZpY2UsIGl0IGlzCj4gPiA+ICsgICAgICAgICAgICAgICAicGNpIHZl
bmRvciBpZCIgfCAoVkZJT19ERVZJQ0VfRkxBR1NfUENJIDw8IDE2KS4KPiA+ID4gKyAgdmVuZG9y
IHByb3ByaWV0YXJ5IHBhcnQ6IHRoaXMgcGFydCBpcyB2YXJpZWQgaW4gbGVuZ3RoLiB2ZW5kb3Ig
ZHJpdmVyIGNhbgo+ID4gPiArICAgICAgICAgICAgICAgc3BlY2lmeSBhbnkgc3RyaW5nIHRvIGlk
ZW50aWZ5IGEgZGV2aWNlLgo+ID4gPiArCj4gPiA+ICsgIFdoZW4gcmVhZGluZyB0aGlzIGF0dHJp
YnV0ZSwgaXQgc2hvdWxkIHNob3cgZGV2aWNlIHZlcnNpb24gc3RyaW5nIG9mIHRoZSBkZXZpY2UK
PiA+ID4gKyAgb2YgdHlwZSA8dHlwZS1pZD4uIElmIGEgZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQg
bGl2ZSBtaWdyYXRpb24sIGl0IHNob3VsZAo+ID4gPiArICByZXR1cm4gZXJybm8uCj4gPiA+ICsg
IFdoZW4gd3JpdGluZyBhIHN0cmluZyB0byB0aGlzIGF0dHJpYnV0ZSwgaXQgcmV0dXJucyBlcnJu
byBmb3IgaW5jb21wYXRpYmlsaXR5Cj4gPiA+ICsgIG9yIHJldHVybnMgd3JpdHRlbiBzdHJpbmcg
bGVuZ3RoIGluIGNvbXBhdGliaWxpdHkgY2FzZS4gSWYgYSBkZXZpY2UgZG9lcyBub3QKPiA+ID4g
KyAgc3VwcG9ydCBsaXZlIG1pZ3JhdGlvbiwgaXQgYWx3YXlzIHJldHVybnMgZXJybm8uCj4gPiA+
ICsKPiA+ID4gKyAgZm9yIGV4YW1wbGUuCj4gPiA+ICsgICMgY2F0IFwKPiA+ID4gKyAvc3lzL2J1
cy9wY2kvZGV2aWNlcy8wMDAwXDowMFw6MDIuMC9tZGV2X3N1cHBvcnRlZF90eXBlcy9pOTE1LUdW
VGdfVjVfMi92ZXJzaW9uCj4gPiA+ICsgIDAwMDI4MDg2LTE5M2ItaTkxNS1HVlRnX1Y1XzIKPiA+
ID4gKwo+ID4gPiArICAjZWNobyAwMDAyODA4Ni0xOTNiLWk5MTUtR1ZUZ19WNV8yID4gXAo+ID4g
PiArIC9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDBcOjAwXDowMi4wL21kZXZfc3VwcG9ydGVkX3R5
cGVzL2k5MTUtR1ZUZ19WNV80L3ZlcnNpb24KPiA+ID4gKyAtYmFzaDogZWNobzogd3JpdGUgZXJy
b3I6IEludmFsaWQgYXJndW1lbnQKPiA+ID4gKyAgCj4gPiAKPiA+IElJVUMgdGhpcyBwYXRoIGlz
IGFnYWluc3QgdGhlIHBoeXNpY2FsIGRldmljZS4gSU9XLCB0aGUgbWdtdCBhcHAgd291bGQgaGF2
ZQo+ID4gdG8gZmlyc3Qgd3JpdGUgdG8gdGhlICJ2ZXJzaW9uIiBmaWxlIHRvIGNob29zZSBhIHZl
cnNpb24sIGFuZCB0aGVuIHdyaXRlIHRvCj4gPiB0aGUgImNyZWF0ZSIgZmlsZSB0byBhY3R1YWxs
eSBjcmVhdGUgYW4gdmlydHVhbCBkZXZpY2UuIFRoaXMgaGFzIHRoZSBvYnZpb3VzCj4gPiBjb25j
dXJyZW5jeSBwcm9ibGVtIGlmIG11bHRpcGxlIGRldmljZXMgYXJlIGJlaW5nIGNyZWF0ZWQgYXQg
dGhlIHNhbWUgdGltZQo+ID4gYW5kIGRpc3RpbmN0IHZlcnNpb25zIGZvciBlYWNoIGRldmljZSBh
cmUgcmVxdWlyZWQuIFRoZXJlIHdvdWxkIG5lZWQgdG8gYmUKPiA+IGEgbG9ja2luZyBzY2hlbWUg
ZGVmaW5lZCB0byBlbnN1cmUgc2FmZXR5Lgo+IAo+ICJDcmVhdGUgYSBkZXZpY2Ugb2YgYSBnaXZl
biB2ZXJzaW9uIiBpcyBub3QgYW4gaW50ZW5kZWQgZmVhdHVyZSBvZiB0aGlzCj4gaW50ZXJmYWNl
IGFpdWkuICBXcml0aW5nIHRoZSB2ZXJzaW9uIGF0dHJpYnV0ZSBvbmx5IGluZGljYXRlcwo+IG1p
Z3JhdGlvbiBjb21wYXRpYmlsaXR5IHdpdGggYSBiaW5hcnkgcmVzdWx0Lgo+ICAKPiA+IFdvdWxk
bid0IGl0IGJlIGJldHRlciBpZiB3ZSBjYW4gcGFzcyB0aGUgZGVzaXJlZCB2ZXJzaW9uIHdoZW4g
d2Ugd3JpdGUgdG8KPiA+IHRoZSAiY3JlYXRlIiBmaWxlLCBzbyB0aGF0IHdlIGF2b2lkIGFueSBj
b25jdXJyZW50IHVzYWdlIHByb2JsZW1zLiAidmVyc2lvbiIKPiA+IGNvdWxkIGJlIGp1c3QgYSBy
ZWFkLW9ubHkgZmlsZSB3aXRoIGEgKmxpc3QqIG9mIHN1cHBvcnRlZCB2ZXJzaW9ucy4KPiA+IAo+
ID4gZWcKPiA+IAo+ID4gICAkIGNhdCAvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAwXDowMFw6MDIu
MC9tZGV2X3N1cHBvcnRlZF90eXBlcy9pOTE1LUdWVGdfVjVfNC92ZXJzaW9uCj4gPiAgIDUuMAo+
ID4gICA1LjEKPiA+ICAgNS4yCj4gPiAKPiA+ICAgJCBlY2hvICI4M2I4ZjRmMi01MDlmLTM4MmYt
M2MxZS1lNmJmZTBmYTEwMDE7dmVyc2lvbj01LjIiID4KPiA+ICAgICAgIC9zeXMvZGV2aWNlcy92
aXJ0dWFsL210dHkvbXR0eS9tZGV2X3N1cHBvcnRlZF90eXBlcy9tdHR5LTIvY3JlYXRlCj4gCj4g
VGhpcyBpcyByZW1pbmlzY2VudCBvZiB0aGUgcHJvcG9zZWQgYWdncmVnYXRpb24gc3VwcG9ydCwg
YnV0IGFnYWluLAo+IHRoaXMgc29ydCBvZiBmZWF0dXJlIGlzIG5vdCBpbnRlbmRlZCBoZXJlLiAg
SXQncyBubyBleHBlY3RlZCB0aGF0IGFueQo+IHZlbmRvciBkcml2ZXIgd291bGQgc3VwcG9ydCBj
cmVhdGluZyBkZXZpY2UgdHlwZXMgb2YgZGlmZmVyZW50Cj4gdmVyc2lvbnMsIGJ1dCB0aGV5IG1h
eSBzdXBwb3J0IG1pZ3JhdGlvbiBmcm9tIGRpZmZlcmVudCB2ZXJzaW9ucy4KCkhtbSwgdGhhdCdz
IGEgc3VidGxlIGRpc3RpbmN0aW9uIEkgd2Fzbid0IHNlZWluZyB0aGUgcGF0Y2ggc2VyaWVzLgpJ
SVVDIGZyb20gd2hhdCB5b3UncmUgc2F5aW5nLCBhIGRldmljZSBjYW4gYmUgY3JlYXRlZCB3aXRo
IHZlcnNpb24KIkMiLCBidXQgZm9yIGFuIGluY29taW5nIG1pZ3JhdGlvbiBpdCBjYW4gKHBvdGVu
dGlhbGx5KSBhY2NlcHQKc2VyaWFsaXplZCBzdGF0ZSBtYXRjaGluZyBhbnkgb2YgdmVyc2lvbnMg
IkEiLCAiQiIgb3IgIkMiLgoKVGhhdCBpcyBzdWZmaWNpZW50IGlmIG1pZ3JhdGlvbiBpcyBiZWlu
ZyB1c2VkIGFzIGEgaG9zdCB1cGdyYWRlCnRvb2wsIHRvIG1vdmUgZnJvbSBPUyByZWxlYXNlIE4g
dG8gTiArIDEuCgpJdCB3b3VsZG4ndCBjb3ZlciB0aGUgY2FzZSB3aGVyZSB5b3UgbmVlZCB0byBz
dXBwb3J0IGJhY2t3YXJkcwptaWdyYXRpb24gdG9vLiBlZyBpZiB5b3UgaGF2ZSBhIG1peHR1cmUg
b2YgaG9zdHMgd2l0aCByZWxlYXNlCk4gYW5kIE4gKyAxIGFuZCB3YW50IHRvIG1ha2Ugc3VyZSB0
aGF0IFZNcyBjYW4gYWx3YXlzIG1vdmUKYmV0d2VlZW4gYW55IGhvc3QuICBUaGF0IHdvdWxkIHJl
cXVpcmUgdGhhdCB5b3UgY2FuIGNyZWF0ZQptZGV2cyB3aXRoIHRoZSBsb3dlc3QgY29tbW9uIGRl
bm9taW5hdG9yIHZlcnNpb24sIG5vdCBzb2xlbHkKdGhlIG1vc3QgcmVjZW50LgoKSW4gUUVNVSB0
aGlzIGlzIGRvbmUgYnkgbWdtdCBhcHBsaWNhdGlvbnMgcGlja2luZyBhIHZlcnNpb25lZAptYWNo
aW5lIHR5cGUgZm9yIFFFTVUgdGhhdCBpcyBvbGRlciB0aGFuIG1vc3QgcmVjZW50LgoKUmVnYXJk
cywKRGFuaWVsCi0tIAp8OiBodHRwczovL2JlcnJhbmdlLmNvbSAgICAgIC1vLSAgICBodHRwczov
L3d3dy5mbGlja3IuY29tL3Bob3Rvcy9kYmVycmFuZ2UgOnwKfDogaHR0cHM6Ly9saWJ2aXJ0Lm9y
ZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8
Cnw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3JnICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0
YWdyYW0uY29tL2RiZXJyYW5nZSA6fApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
