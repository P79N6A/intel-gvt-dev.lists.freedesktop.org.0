Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp6407663ywb;
        Wed, 27 Mar 2019 13:19:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0qnf5nMmSq/8+ax0Npn3D3FqToOwtqYV/2hd7shsTMYUu+OXC0ymirM15IZ09Qwpvih0l
X-Received: by 2002:a17:902:9a0b:: with SMTP id v11mr38875285plp.194.1553717950971;
        Wed, 27 Mar 2019 13:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553717950; cv=none;
        d=google.com; s=arc-20160816;
        b=U+ExDliH2DmTrPP6YDO03xjQGvrKzkxOCFpYvyAUhNFDpPMbM/HEqGTxFDWfh+vXj4
         gpHHr8FnFYVVCB1Nj7YErmR8oVXpk+bpR2v7VjZwMGVI7oVlL+3cKVsSZb688seMa1pQ
         xzZY/+17MRpTbn9FegQmYijAqkgZ4fuZHLNXCurB4SyEwP3/P/RRZds6vTLdLEE0yPR4
         Yez4yOdeiOr8oCrI5CNQHK+j7elIfO1NMBiYx7yOHdNaTqX/VIqpRDaEZWyPENjFvqGV
         S5c2C6cacq9v3NIILH9Xm1ZcP/0qSGc7i71GR2QTR1M4iCXEgkdcs7SUuFD3dKUiMB+O
         6vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=kaPHulb0JKYM4E5L/Ps5PRGNpbx8sCxXRDcOXpHw4yM=;
        b=qEbhay5SZbxZ/bxBls9Ltzqf0Vve4Xa18NmMJtULtq5vagUyF0+DiW9YuvGaIgLW1z
         tb4Rhc9yvj3VjDt8MVML2k7jIaPmy89bWMinlsWKObP+c1Q8uMa4RzLDz/Rfx9zt2HcL
         jKgpDi2i+m+OmRETiykaaiaxb3Y3kXYk3jfoPg/LmoKxf3WWed7wKzysWv6pqK3lsab+
         91jn7/3wa41nFU5yweXGWNTkotjvjbGAp73rEPNlHXQq1+DfjmIHN87D6jCJU74OXcCd
         5OvdiojbhLkHiSF6ofvjuJWp31uC0GuwWg2kbtPIu5a1tKN7eugAP46Fp2T2eHvRE9C6
         8ASg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g9si19076142pgi.518.2019.03.27.13.19.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2019 13:19:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020486E28A;
	Wed, 27 Mar 2019 20:19:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CF76E28A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Mar 2019 20:19:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F19FC85550;
 Wed, 27 Mar 2019 20:19:06 +0000 (UTC)
Received: from work-vm (ovpn-117-218.ams2.redhat.com [10.36.117.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3559A19C77;
 Wed, 27 Mar 2019 20:18:57 +0000 (UTC)
Date: Wed, 27 Mar 2019 20:18:54 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhao Yan <yan.y.zhao@intel.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190327201854.GG2636@work-vm>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190219113212.GC2941@work-vm>
 <20190220052838.GC16456@joy-OptiPlex-7040>
 <20190220110142.GD2608@work-vm>
 <33183CC9F5247A488A2544077AF19020DB25D30F@dggeml511-mbx.china.huawei.com>
 <20190220124242.5a1685c5.cohuck@redhat.com>
 <20190327063509.GD14681@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190327063509.GD14681@joy-OptiPlex-7040>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 27 Mar 2019 20:19:07 +0000 (UTC)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, alex.williamson@redhat.com,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

KiBaaGFvIFlhbiAoeWFuLnkuemhhb0BpbnRlbC5jb20pIHdyb3RlOgo+IE9uIFdlZCwgRmViIDIw
LCAyMDE5IGF0IDA3OjQyOjQyUE0gKzA4MDAsIENvcm5lbGlhIEh1Y2sgd3JvdGU6Cj4gPiA+ID4g
PiA+ICAgYikgSG93IGRvIHdlIGRldGVjdCBpZiB3ZSdyZSBtaWdyYXRpbmcgZnJvbS90byB0aGUg
d3JvbmcgZGV2aWNlIG9yCj4gPiA+ID4gPiA+IHZlcnNpb24gb2YgZGV2aWNlPyAgT3Igc2F5IHRv
IGEgZGV2aWNlIHdpdGggb2xkZXIgZmlybXdhcmUgb3IgcGVyaGFwcwo+ID4gPiA+ID4gPiBhIGRl
dmljZSB0aGF0IGhhcyBsZXNzIGRldmljZSBtZW1vcnkgPyAgCj4gPiA+ID4gPiBBY3R1YWxseSBp
dCdzIHN0aWxsIGFuIG9wZW4gZm9yIFZGSU8gbWlncmF0aW9uLiBOZWVkIHRvIHRoaW5rIGFib3V0
Cj4gPiA+ID4gPiB3aGV0aGVyIGl0J3MgYmV0dGVyIHRvIGNoZWNrIHRoYXQgaW4gbGlidmlydCBv
ciBxZW11IChsaWtlIGEgZGV2aWNlIG1hZ2ljCj4gPiA+ID4gPiBhbG9uZyB3aXRoIHZlcmlvbiA/
KS4gIAo+ID4gPiAKPiA+ID4gV2UgbXVzdCBrZWVwIHRoZSBoYXJkd2FyZSBnZW5lcmF0aW9uIGlz
IHRoZSBzYW1lIHdpdGggb25lIFBPRCBvZiBwdWJsaWMgY2xvdWQKPiA+ID4gcHJvdmlkZXJzLiBC
dXQgd2Ugc3RpbGwgdGhpbmsgYWJvdXQgdGhlIGxpdmUgbWlncmF0aW9uIGJldHdlZW4gZnJvbSB0
aGUgdGhlIGxvd2VyCj4gPiA+IGdlbmVyYXRpb24gb2YgaGFyZHdhcmUgbWlncmF0ZWQgdG8gdGhl
IGhpZ2hlciBnZW5lcmF0aW9uLgo+ID4gCj4gPiBBZ3JlZWQsIGxvd2VyLT5oaWdoZXIgaXMgdGhl
IG9uZSBkaXJlY3Rpb24gdGhhdCBtaWdodCBtYWtlIHNlbnNlIHRvCj4gPiBzdXBwb3J0Lgo+ID4g
Cj4gPiBCdXQgcmVnYXJkbGVzcyBvZiB0aGF0LCBJIHRoaW5rIHdlIG5lZWQgdG8gbWFrZSBzdXJl
IHRoYXQgaW5jb21wYXRpYmxlCj4gPiBkZXZpY2VzL3ZlcnNpb25zIGZhaWwgZGlyZWN0bHkgaW5z
dGVhZCBvZiBmYWlsaW5nIGluIGEgc3VidGxlLCBoYXJkIHRvCj4gPiBkZWJ1ZyB3YXkuIE1pZ2h0
IGJlIHVzZWZ1bCB0byBkbyBzb21lIGluaXRpYWwgc2FuaXR5IGNoZWNrcyBpbiBsaWJ2aXJ0Cj4g
PiBhcyB3ZWxsLgo+ID4gCj4gPiBIb3cgZWFzeSBpcyBpdCB0byBvYnRhaW4gdGhhdCBpbmZvcm1h
dGlvbiBpbiBhIGZvcm0gdGhhdCBjYW4gYmUKPiA+IGNvbnN1bWVkIGJ5IGhpZ2hlciBsYXllcnM/
IENhbiB3ZSBmaW5kIG91dCB0aGUgZGV2aWNlIHR5cGUgYXQgbGVhc3Q/Cj4gPiBXaGF0IGFib3V0
IHNvbWUga2luZCBvZiByZXZpc2lvbj8KPiBoaSBBbGV4IGFuZCBDb3JuZWxpYQo+IGZvciBkZXZp
Y2UgY29tcGF0aWJpbGl0eSwgZG8geW91IHRoaW5rIGl0J3MgYSBnb29kIGlkZWEgdG8gdXNlICJ2
ZXJzaW9uIgo+IGFuZCAiZGV2aWNlIHZlcnNpb24iIGZpZWxkcz8KPiAKPiB2ZXJzaW9uIGZpZWxk
OiBpZGVudGlmeSBsaXZlIG1pZ3JhdGlvbiBpbnRlcmZhY2UncyB2ZXJzaW9uLiBpdCBjYW4gaGF2
ZSBhCj4gc29ydCBvZiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LCBsaWtlIHRhcmdldCBtYWNoaW5l
J3MgdmVyc2lvbiA+PSBzb3VyY2UKPiBtYWNoaW5lJ3MgdmVyc2lvbi4gc29tZXRoaW5nIGxpa2Ug
dGhhdC4KPiAKPiBkZXZpY2VfdmVyc2lvbiBmaWVsZCBjb25zaXN0cyB0d28gcGFydHM6Cj4gMS4g
dmVuZG9yIGlkIDogaXQgdGFrZXMgMzIgYml0cy4gZS5nLiAweDgwODYuCj4gMi4gdmVuZG9yIHBy
b3ByaWV0YXJ5IHN0cmluZzogaXQgY2FuIGJlIGFueSBzdHJpbmcgdGhhdCBhIHZlbmRvciBkcml2
ZXIKPiB0aGlua3MgY2FuIGlkZW50aWZ5IGEgc291cmNlIGRldmljZS4gZS5nLiBwY2lpZCArIG1k
ZXYgdHlwZS4KPiAidmVuZG9yIGlkIiBpcyB0byBhdm9pZCBvdmVybGFwIG9mICJ2ZW5kb3IgcHJv
cHJpZXRhcnkgc3RyaW5nIi4KPiAKPiAKPiBzdHJ1Y3QgdmZpb19kZXZpY2Vfc3RhdGVfY3RsIHsK
PiAgICAgIF9fdTMyIHZlcnNpb247ICAgICAgICAgICAgLyogcm8gKi8KPiAgICAgIF9fdTggZGV2
aWNlX3ZlcnNpb25bTUFYX0RFVklDRV9WRVJTSU9OX0xFTl07ICAgICAgICAgICAgLyogcm8gKi8K
PiAgICAgIHN0cnVjdCB7Cj4gICAgICAJX191MzIgYWN0aW9uOyAvKiBHRVRfQlVGRkVSLCBTRVRf
QlVGRkVSLCBJU19DT01QQVRJQkxFKi8KPiAJLi4uCj4gICAgICB9ZGF0YTsKPiAgICAgIC4uLgo+
ICB9Owo+IAo+IFRoZW4sIGFuIGFjdGlvbiBJU19DT01QQVRJQkxFIGlzIGFkZGVkIHRvIGNoZWNr
IGRldmljZSBjb21wYXRpYmlsaXR5Lgo+IAo+IFRoZSBmbG93IHRvIGZpZ3VyZSBvdXQgd2hldGhl
ciBhIHNvdXJjZSBkZXZpY2UgaXMgbWlncmF0YWJsZSB0byB0YXJnZXQgZGV2aWNlCj4gaXMgbGlr
ZSB0aGF0Ogo+IDEuIGluIHNvdXJjZSBzaWRlJ3MgLnNhdmVfc2V0dXAsIHNhdmUgc291cmNlIGRl
dmljZSdzIGRldmljZV92ZXJzaW9uIHN0cmluZwo+IDIuIGluIHRhcmdldCBzaWRlJ3MgLmxvYWRf
c3RhdGUsIGxvYWQgc291cmNlIGRldmljZSdzIGRldmljZSB2ZXJzaW9uIHN0cmluZwo+IGFuZCB3
cml0ZSBpdCB0byBkYXRhIHJlZ2lvbiwgYW5kIGNhbGwgSVNfQ09NUEFUSUJMRSBhY3Rpb24gdG8g
YXNrIHZlbmRvciBkcml2ZXIKPiB0byBjaGVjayB3aGV0aGVyIHRoZSBzb3VyY2UgZGV2aWNlIGlz
IGNvbXBhdGlibGUgdG8gaXQuCj4gCj4gVGhlIGFkdmFudGFnZSBvZiBhZGRpbmcgYW4gSVNfQ09N
UEFUSUJMRSBhY3Rpb24gaXMgdGhhdCwgdmVuZG9yIGRyaXZlciBjYW4KPiBtYWludGFpbiBhIGNv
bXBhdGliaWxpdHkgdGFibGUgYW5kIGRlY2lkZSB3aGV0aGVyIHNvdXJjZSBkZXZpY2UgaXMgY29t
cGF0aWJsZQo+IHRvIHRhcmdldCBkZXZpY2UgYWNjb3JkaW5nIHRvIGl0cyBwcm9wcmlldGFyeSB0
YWJsZS4KPiBJbiBkZXZpY2VfdmVyc2lvbiBzdHJpbmcsIHZlbmRvciBkcml2ZXIgb25seSBoYXMg
dG8gZGVzY3JpYmUgdGhlIHNvdXJjZQo+IGRldmljZSBhcyBlbGFib3JhdGVseSBhcyBwb3NzaWJs
ZSBhbmQgcmVzb3J0cyB0byB2ZW5kb3IgZHJpdmVyIGluIHRhcmdldCBzaWRlCj4gdG8gZmlndXJl
IG91dCB3aGV0aGVyIHRoZXkgYXJlIGNvbXBhdGlibGUuCgpJdCB3b3VsZCBhbHNvIGJlIGdvb2Qg
aWYgdGhlICdJU19DT01QQVRJQkxFJyB3YXMgc29tZWhvdyBjYWxsYWJsZQpleHRlcm5hbGx5IC0g
c28gd2UgY291bGQgYmUgYWJsZSB0byBhbnN3ZXIgYSBxdWVzdGlvbiBsaWtlICdjYW4gd2UKbWln
cmF0ZSB0aGlzIFZNIHRvIHRoaXMgaG9zdCcgLSBmcm9tIHRoZSBtYW5hZ2VtZW50IGxheWVyIGJl
Zm9yZSBpdAphY3R1YWxseSBzdGFydHMgdGhlIG1pZ3JhdGlvbi4KCkRhdmUKCj4gVGhhbmtzCj4g
WWFuCj4gCj4gCj4gCi0tCkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQgLyBkZ2lsYmVydEByZWRoYXQu
Y29tIC8gTWFuY2hlc3RlciwgVUsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2
