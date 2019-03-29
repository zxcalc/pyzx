// Initial wiring: [9, 15, 13, 7, 10, 14, 17, 2, 5, 19, 11, 6, 0, 1, 8, 3, 4, 16, 18, 12]
// Resulting wiring: [9, 15, 13, 7, 10, 14, 17, 2, 5, 19, 11, 6, 0, 1, 8, 3, 4, 16, 18, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[11];
cx q[17], q[18];
cx q[18], q[17];
cx q[14], q[15];
cx q[13], q[15];
cx q[6], q[13];
cx q[6], q[7];
cx q[3], q[5];
