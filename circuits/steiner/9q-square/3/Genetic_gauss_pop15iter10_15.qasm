// Initial wiring: [6 2 1 3 4 0 5 7 8]
// Resulting wiring: [7 2 1 3 4 0 5 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[0], q[1];
cx q[7], q[8];
