// Initial wiring: [0 7 2 4 1 6 5 3 8]
// Resulting wiring: [0 4 2 7 1 6 5 3 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[8], q[7];
cx q[6], q[5];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[5];
cx q[2], q[3];
