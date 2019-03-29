// Initial wiring: [14, 2, 7, 4, 18, 6, 5, 13, 10, 19, 15, 11, 9, 12, 1, 0, 3, 8, 17, 16]
// Resulting wiring: [14, 2, 7, 4, 18, 6, 5, 13, 10, 19, 15, 11, 9, 12, 1, 0, 3, 8, 17, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[9], q[0];
cx q[10], q[9];
cx q[10], q[8];
cx q[12], q[11];
cx q[18], q[11];
cx q[19], q[18];
cx q[18], q[17];
cx q[19], q[18];
cx q[16], q[17];
cx q[11], q[12];
cx q[8], q[11];
cx q[11], q[12];
cx q[7], q[12];
cx q[12], q[11];
cx q[6], q[13];
cx q[6], q[12];
cx q[13], q[15];
cx q[13], q[14];
cx q[12], q[11];
cx q[4], q[6];
