// Initial wiring: [5, 10, 6, 9, 3, 13, 2, 15, 11, 12, 14, 1, 0, 4, 8, 7]
// Resulting wiring: [5, 10, 6, 9, 3, 13, 2, 15, 11, 12, 14, 1, 0, 4, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[8], q[7];
cx q[10], q[9];
cx q[13], q[12];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[13], q[14];
cx q[14], q[13];
cx q[12], q[13];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[14];
cx q[13], q[12];
cx q[14], q[13];
cx q[10], q[13];
cx q[8], q[15];
cx q[15], q[14];
