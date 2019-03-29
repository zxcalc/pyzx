// Initial wiring: [1, 13, 4, 8, 9, 2, 5, 10, 15, 14, 7, 3, 6, 12, 0, 11]
// Resulting wiring: [1, 13, 4, 8, 9, 2, 5, 10, 15, 14, 7, 3, 6, 12, 0, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[14], q[9];
cx q[14], q[13];
cx q[9], q[6];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[15];
cx q[13], q[14];
cx q[10], q[13];
cx q[13], q[14];
cx q[14], q[15];
cx q[13], q[12];
cx q[6], q[9];
cx q[5], q[6];
cx q[6], q[9];
