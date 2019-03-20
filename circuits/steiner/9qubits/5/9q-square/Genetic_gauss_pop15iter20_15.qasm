// Initial wiring: [0 7 2 4 1 5 6 3 8]
// Resulting wiring: [0 6 2 4 1 5 7 3 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[7], q[8];
cx q[4], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[1], q[2];
cx q[7], q[8];
