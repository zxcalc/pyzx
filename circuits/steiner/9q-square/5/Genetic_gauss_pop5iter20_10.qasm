// Initial wiring: [5 2 1 3 4 7 0 6 8]
// Resulting wiring: [5 3 1 2 4 6 0 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[8], q[7];
cx q[4], q[3];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[2], q[3];
cx q[2], q[3];
cx q[2], q[3];
cx q[3], q[8];
cx q[8], q[7];
