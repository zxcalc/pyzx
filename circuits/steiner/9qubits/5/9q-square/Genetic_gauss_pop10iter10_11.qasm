// Initial wiring: [7 1 2 3 4 0 5 6 8]
// Resulting wiring: [6 1 2 3 4 0 5 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[1], q[4];
cx q[2], q[3];
cx q[7], q[8];
